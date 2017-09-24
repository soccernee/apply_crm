class CreateApplicationCycles < ActiveRecord::Migration[5.1]
  def change
    create_table :application_cycles do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
