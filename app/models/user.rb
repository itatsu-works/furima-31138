class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,              presence: true
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_kana,             presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_kana,            presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,              presence: true

  validates :email,         uniqueness: true
  validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i  }
end