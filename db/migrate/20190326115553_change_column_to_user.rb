class ChangeColumnToUser < ActiveRecord::Migration[5.2]
	def change
		rename_column :users, :user_id, :booklog_id
  end
end
