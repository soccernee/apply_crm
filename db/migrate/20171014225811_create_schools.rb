class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :num_students

      t.timestamps
    end
  end
end
