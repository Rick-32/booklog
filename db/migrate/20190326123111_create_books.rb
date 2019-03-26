class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
			t.integer :isbn, null: false, unique: true
			t.string :title, null: false
			t.integer :price
			t.string :publisher
			t.datetime :published_at
			t.string :image
      t.timestamps null: false
    end
  end
end
