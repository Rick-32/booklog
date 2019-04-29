class RemoveColumn < ActiveRecord::Migration[5.2]
	def change
		remove_column :books, :published_at, :datetime
		add_column :books, :published_at, :date
  end
end
