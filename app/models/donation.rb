class Donation < ApplicationRecord
  belongs_to :matter
  belongs_to :user
  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
end
