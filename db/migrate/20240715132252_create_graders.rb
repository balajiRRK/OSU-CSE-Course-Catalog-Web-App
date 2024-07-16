class CreateGraders < ActiveRecord::Migration[7.1]
  def change
    create_table :graders do |t|
      t.string :lname
      t.string :fname
      t.string :email

      t.timestamps
    end
  end
end
