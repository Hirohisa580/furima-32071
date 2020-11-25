class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_items
  has_many :items

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/}

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_ruby
    validates :last_name_ruby
    validates :birthday
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :first_name
    validates :last_name
  end

  with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} do
    validates :first_name_ruby
    validates :last_name_ruby
  end
end
