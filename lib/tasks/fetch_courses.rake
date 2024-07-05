
desc "Grabs all the courses from specified from the api"
task :fetch_courses => [ :environment ] do

puts Rainbow('Adding courses').yellow

response = '?q=&subject=cse&academiccareer=Undergraduate&campus=col' #&term=1248&campus=col&catalog-number=2xxx&p=2'
osu = OsuApiService::OsuAPI.new response

# 
pages = osu.fetch_data_info_From_Query['totalPages']
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

desc "Grabs all the sections from specified from the api"
task :fetch_sections => [ :environment ] do

    puts Rainbow('Adding sections').yellow
       
    response = '?q=&subject=cse&academiccareer=Undergraduate&campus=col' #&term=1248&campus=col&catalog-number=2xxx&p=2'
    osu = OsuApiService::OsuAPI.new response
    pages = osu.fetch_data_info_From_Query['totalPages']
    sections = osu.fetch_From_Query
    
    (1..pages).each do |i|
     
          sections.each do |section_data| 
               course_section = Section.new()
               # Nested loops are used to create a section for each meeting and instructor
               # This will loop for each section under a course
                    section_data['sections'].each do |subsection_data|
                         subsection_data['meetings'].each do |meeting_data|
                              meeting_data['instructors'].each do |instructor_data|

                                   # The reason I added the sections this way is because I originally thought I needed to add them at different blocks

                                   #all of an specific section is added here to avoid skipping over sections
                                   # Adds the sections parts at the subsection level
                                   course_section.course_id = subsection_data['courseId']

                                   course_section.catalog_number = subsection_data['catalogNumber']
                                   course_section.class_number = subsection_data['classNumber']
                                   course_section.component = subsection_data['component']
                                   course_section.term = subsection_data['term']
                                   course_section.section = subsection_data['section']
                                   # Adds the sections parts at the meeting level
                                   course_section.facility_id = meeting_data['facilityId']
                                   course_section.facility_description = meeting_data['facilityDescription']
                                   course_section.room = meeting_data['room']
                                   course_section.start_time = meeting_data['startTime']
                                   course_section.end_time = meeting_data['endTime']
                                   course_section.start_date = meeting_data['startDate']
                                   course_section.end_date = meeting_data['endDate']
                                   course_section.monday = meeting_data['monday']
                                   course_section.tuesday = meeting_data['tuesday']
                                   course_section.wednesday = meeting_data['wednesday']
                                   course_section.thursday = meeting_data['thursday']
                                   course_section.friday = meeting_data['friday']
                                   course_section.saturday = meeting_data['saturday']
                                   course_section.sunday = meeting_data['sunday']
                                   course_section.instruction_mode = subsection_data['instructionMode']

                                   # Adds the section parts at the instructor level
                                   course_section.instructor = instructor_data['displayName']
                                   course_section.instructor_role = instructor_data['role']
                                   course_section.instructor_email = instructor_data['email']
                                   course_section.save
                              end
                         end


                    end

          end
               # Changes the page to the next one
               paged_response = response+ "&p="+ i.to_s
               osu.change_response paged_response
               sections = osu.fetch_From_Query
          end

          puts Rainbow('Sections fetch complete!').green
end
