class AddBookshelfProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bookshelf_profile, :string
  end
end
