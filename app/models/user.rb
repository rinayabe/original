class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matters, foreign_key: :user_id, dependent: :destroy
  has_many :donations, foreign_key: :user_id, dependent: :destroy

  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\z/i.freeze
    validates :email,              uniqueness: { case_sensitive: true }
    validates_format_of :email,    with: VALID_EMAIL_REGEX
    validates :password
  end
end
