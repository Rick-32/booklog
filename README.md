## usersテーブル

|Column|Type|Options|
|------|----|-------|
|username|string|null: false, unique: true|
|password|string|null: false|
|email|string|null: false, unique: true|
|gender|integer|null: false|
|birthdate|integer|null: false|
|bookshelf_name|string|null: false, unique: true|
|prefecture|integer|null: false|
|hometown|string||
|occupation|string||
|profile|text||

### Association
- has_many :books_users
- has_many :books, through: :books_users
- has_many :reviews, through: :books_users
- has_many :comments, through: reviews
- has_many :favorites, through: reviews

## books_usersテーブル

|Column|Type|Options|
|------|----|-------|
|book_id|integer|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :book

## booksテーブル

|Column|Type|Options|
|------|----|-------|
|ISBN|integer|null: false, unique: true|
|title|string|null: false|
|price|integer||
|publish|string||
|published|integer||
|image|string||

### Association
- has_many :reviews
- has_many :books_users
- has_many :reread_reviews

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|review_id|integer|null: false|
|user_id|integer|null: false|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :review

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|review_id|integer|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :review

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|book_id|integer|null: false|
|user_id|integer|null: false|
|reading_status|integer||
|rate|integer||
|content|text||
|spoiler_alert|boolean|default: false, null: false|
|registration_date|integer||
|memo|text||
|private_option|boolean|default: false, null: false|

### Association
- belongs_to :user
- belongs_to :book
- has_many :comments
- has_many :favorites
- has_one :books_users

## reread_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|book_id|integer|null: false|
|user_id|integer|null: false|
|reread_date|integer||
|reread_rate|integer||
|reread_review|text||

### Association
- belongs_to :user
- belongs_to :book
- has_one :books_users

## phrasesテーブル

|Column|Type|Options|
|------|----|-------|
|book_id|integer|null: false|
|user_id|integer|null: false|
|phrase|text||
|phrase_page|integer||

### Association
- belongs_to :user
- belongs_to :book
- has_one :books_users

