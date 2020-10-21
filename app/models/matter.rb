class Matter < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :donations

  validates :price, presence: true
  validates :name, presence: true
  validates :explain, presence: true
end
