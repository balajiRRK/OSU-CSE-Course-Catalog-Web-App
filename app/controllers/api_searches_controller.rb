class ApiSearchesController < ApplicationController
  before_action :authenticate_admin!, :authenticate_status!, :set_api_search, only: %i[ show edit update destroy ]
  
  # GET /api_searches or /api_searches.json
  def index
    @api_searches = ApiSearch.all
  end

  # GET /api_searches/1 or /api_searches/1.json
  def show
    # response = to_response
    # puts response
    # download
   
  end

  # GET /api_searches/new
  def new
    @api_search = ApiSearch.new
  end

  # GET /api_searches/1/edit
  def edit
  end

  

  def fetch_courses response

    puts Rainbow('Adding courses').yellow
    
    
    osu = OsuApiService::OsuAPI.new response
    
    pages =  osu.fetch_data_info_From_Query['totalPages']
    courses = osu.fetch_From_Query
    
    (1..pages).each do |i|
        
    courses.each do |course_data| 
        
       course_class = Course.new(title: course_data['course']['title'], courseId: course_data['course']['courseId'],
         description: course_data['course']['description'], catalog_number: course_data['course']['catalogNumber'], 
         component: course_data['course']['component'], term: course_data['course']['term'], campus: course_data['course']['campus'],
         subject: course_data['course']['subject'], catalog_level: course_data['course']['catalogLevel'], short_description: course_data['course']['shortDescription '] )
         
         course_class.save
    end
    paged_response = response+ "&p="+ i.to_s
    
    
    osu.change_response paged_response
    courses = osu.fetch_From_Query
    end
    puts Rainbow('Course fetch complete!').green
  end
  
  def to_response 
    @api_search = ApiSearch.find(params[:id])
    response = '?q='
    # :search, :term, :campus, :academic_career, :catalog_number, :catalog_level, :component, :subject, :instruction_mode, :evening, :course_id)
    # Single line ifs to make the code cleaner
    puts @api_search.class
    
    @api_search.search.blank? ? response : response = response + @api_search.search
    @api_search.term.blank? ? response : response = response + "&term=" + @api_search.term 
    @api_search.campus.blank? ? response : response = response + "&campus=" + @api_search.campus 
    @api_search.academic_career.blank? ? response : response = response + "&academic-career=" + @api_search.academic_career
    @api_search.catalog_number.blank? ? response : response = response + "&catalogNumber=" + @api_search.catalog_number 
    @api_search.catalog_level.blank? ? response : response = response + "&catalogLevel=" + @api_search.catalog_level 
    @api_search.component.blank? ? response : response = response + "&component=" + @api_search.component 
    @api_search.subject.blank? ? response : response = response + "&subject=" + @api_search.subject 
    @api_search.instruction_mode.blank? ? response : response = response + "&instruction-mode=" + @api_search.instruction_mode
    @api_search.evening.blank? ? response : response = response + "&evening=" + @api_search.evening 
    @api_search.course_id.nil? ?  response : response = response + "&courseId=" + @api_search.course_id.to_s 
       
  end 

  # POST /api_searches or /api_searches.json
  def create
    @api_search = ApiSearch.new(api_search_params)

    respond_to do |format|
      if @api_search.save
        format.html { redirect_to api_search_url(@api_search), notice: "Api search was successfully created." }
        format.json { render :show, status: :created, location: @api_search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api_searches/1 or /api_searches/1.json
  def update
    respond_to do |format|
      if @api_search.update(api_search_params)
        format.html { redirect_to api_search_url(@api_search), notice: "Api search was successfully updated." }
        format.json { render :show, status: :ok, location: @api_search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_search.errors, status: :unprocessable_entity }
      end
    end
  end

  def download 
   puts ApiSearch.find(params[:id]).methods
    response = to_response
    # puts response
    fetch_courses response
    respond_to do |format|
      format.html { redirect_to api_searches_url, notice: "Data from the api was successfully downloaded." }
      format.json { head :no_content }
    end
  end
  # DELETE /api_searches/1 or /api_searches/1.json
  def destroy
    @api_search.destroy!

    respond_to do |format|
      format.html { redirect_to api_searches_url, notice: "Api search was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_search
      @api_search = ApiSearch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_search_params
      params.require(:api_search).permit(:search, :term, :campus, :academic_career, :catalog_number, :catalog_level, :component, :subject, :instruction_mode, :evening, :course_id)
    end
end
