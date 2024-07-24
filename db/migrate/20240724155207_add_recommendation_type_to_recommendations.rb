class AddRecommendationTypeToRecommendations < ActiveRecord::Migration[7.1]
  def change
    add_column :recommendations, :recommendation_type, :string
  end
end
