class ChangeGenderToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :gender, :integer, null: false, default: 0
    change_column :users, :bookshelf_name, :string, null: false, default: "題名のない本棚"
  end
end
