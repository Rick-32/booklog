class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, unique: true
    add_column :users, :gender, :integer, null: false
    add_column :users, :birthdate, :string, null: false
    add_column :users, :bookshelf_name, :string, null: false, unique: true
    add_column :users, :prefecture, :integer, null: false
    add_column :users, :hometown, :string
    add_column :users, :occupation, :string
    add_column :users, :profile, :text
  end
end
