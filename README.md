## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|gender|integer|null: false|
|birthdate|string|null: false|
|bookshelf_name|string|null: false, unique: true|
|prefecture|integer|null: false|
|hometown|string|
|occupation|string|
|profile|text|

### Association
- has_many :books_users
- has_many :books, through: :books_users
- has_many :reviews, through: :books_users
- has_many :comments, through: reviews
- has_many :favorites, through: reviews

### memo
認証機能にdeviseを使用予定。password・emailなどは自動生成されるため、READMEには記述していない。

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
|isbn|integer|null: false, unique: true|
|title|string|null: false|
|price|integer|
|publisher|string|
|published_at|datetime|
|image|string|

### Association
- has_many :reviews
- has_many :books_users
- has_many :reread_reviews

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|book|references|null: false|
|user|references|null: false|
|reading_status|integer|
|rate|integer|
|content|text|
|spoiler_alert|boolean|default: false, null: false|
|registrated_at|datetime|
|memo|text|
|private_option|boolean|default: false, null: false|

### Association
- belongs_to :user
- belongs_to :book
- has_many :comments
- has_many :favorites
- has_one :books_users

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|review|references|null: false|
|user|references|null: false|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :review

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|review|references|null: false|
|user|references|null: false|

### Association
- belongs_to :user
- belongs_to :review



## reread_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|book|references|null: false|
|user|references|null: false|
|reread_at|datetime|
|reread_rate|integer|
|reread_review|text|

### Association
- belongs_to :user
- belongs_to :book
- has_one :books_users

## phrasesテーブル

|Column|Type|Options|
|------|----|-------|
|book|references|null: false|
|user|references|null: false|
|phrase|text|
|phrase_page|integer||

### Association
- belongs_to :user
- belongs_to :book
- has_one :books_users

![booklog_new_diagram_-_cacoo](https://user-images.githubusercontent.com/42862643/50732142-d1ea6e80-11b7-11e9-9ab9-c0394ade2027.png)
