class CreateBooksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :books_users do |t|
      t.integer           :book_id, null: false
      t.integer           :user_id, null: false
      t.timestamps null: true
    end
  end
end
