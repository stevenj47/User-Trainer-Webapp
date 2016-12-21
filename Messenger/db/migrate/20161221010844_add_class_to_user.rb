class AddClassToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :class, :integer
  end
end
