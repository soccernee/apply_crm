class ModifySchoolApplication < ActiveRecord::Migration[5.1]
  def change
    remove_column :school_applications, :name, :string

    add_column :school_applications, :application_cycle_id, :integer
    add_column :school_applications, :school_id, :integer
    add_column :school_applications, :status, :integer
    add_column :school_applications, :due_date, :datetime
  end
end
