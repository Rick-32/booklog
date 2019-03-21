class User < ApplicationRecord

	enum gender: {
		男性:0,女性:1,秘密:2
	}

	enum prefecture: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable, :confirmable,
				 :authentication_keys => [:user_id]

	validates :user_id,
		uniqueness: { case_sensitive: :false },
		length: { minimum: 3, maximum: 16 },
		format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}

	attr_accessor :login
	#usernameを必須・一意とする
	validates_uniqueness_of :user_id
	validates_presence_of :user_id

	#usernameを利用してログインするようにオーバーライド
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			#認証の条件式を変更する
			where(conditions).where(["user_id = :value OR password = :value", { :value => login }]).first
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
end
