class ChangeDatatypePublishedatOfBooks < ActiveRecord::Migration[5.2]
	def change
		change_column :books, :published_at, :datetime
  end
end
