class AddBirthYToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_y, :integer
    add_column :users, :birth_m, :integer
    add_column :users, :birth_d, :integer
  end
end
