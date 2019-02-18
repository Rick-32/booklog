class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable,
				 :authentication_keys => [:user_id]

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
