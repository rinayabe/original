class Donation < ApplicationRecord
  belongs_to :matter, optional: true
  belongs_to :user, optional: true
  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price, inclusion: { in: (50..9_999_999) },
                    format: { with: PRICE_REGEX }
end
