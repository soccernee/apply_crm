class CreateUsersApplicationCyclePrivileges < ActiveRecord::Migration[5.1]
  def change
    create_table :application_cycle_privileges do |t|
      t.references :user
      t.references :application_cycle
      t.integer :privilege

      t.timestamps
    end
  end
end
