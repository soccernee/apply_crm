class RemoveApplication < ActiveRecord::Migration[5.1]
  def up
    drop_table :applications
  end
end
