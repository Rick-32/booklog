class Book < ApplicationRecord
  has_many :booksUsers
  has_many :users, through: :booksUsers
end
