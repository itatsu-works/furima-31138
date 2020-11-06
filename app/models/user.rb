class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :item
  has_many :sold

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :nickname
    validates :last_name,              format: { with: NAME_REGEX }
    validates :first_name,             format: { with: NAME_REGEX }
    validates :last_kana,              format: { with: KANA_REGEX }
    validates :first_kana,             format: { with: KANA_REGEX }
    validates :birthday
  end

  validates :email, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
