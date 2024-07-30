class AddStatusToRecommendations < ActiveRecord::Migration[7.1]
  def change
    add_column :recommendations, :status, :integer, default: 0, null: false
  end
end
