class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.text :note
      t.float :latitude
      t.float :longitude
      t.integer :map_id

      t.timestamps null: false
    end
  end
end
