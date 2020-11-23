class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name
    validates :last_name

  with_options presence: true, format: { with:  /^[ァ-ンー－]+$/ }
    validates :first_name_kana
    validates :last_name_kana
end
