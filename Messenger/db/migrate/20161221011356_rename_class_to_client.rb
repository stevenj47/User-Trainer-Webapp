class RenameClassToClient < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :class, :client
  end
end
