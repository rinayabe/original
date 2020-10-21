class Matter < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :donations

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates :price, inclusion: { in: (1..999_999_999) },
                      format: { with: PRICE_REGEX }
  end
end
