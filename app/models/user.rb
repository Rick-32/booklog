class User < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture, :shortcuts => [:name]
	enum gender: {
		男性:0,女性:1,秘密:2
	}


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable, :confirmable,
				 :authentication_keys => [:booklog_id]

	validates :booklog_id,
		uniqueness: { case_sensitive: :false },
		length: { minimum: 3, maximum: 16 },
		format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}

	attr_accessor :login
	#usernameを必須・一意とする
	validates_uniqueness_of :booklog_id
	validates_presence_of :booklog_id

	#usernameを利用してログインするようにオーバーライド
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			#認証の条件式を変更する
			where(conditions).where(["booklog_id = :value OR password = :value", { :value => login }]).first
		else
			where(conditions).first
		end
	end

	#登録時にemailを不要とする
	def email_required?
		false
	end

	def email_changed?
		false
	end
	# FIXME:もしかしたらいらんデータも道連れに消去してしまうかも
	has_many :booksUsers, dependent: :destroy
	has_many :books, through: :booksUsers

end
