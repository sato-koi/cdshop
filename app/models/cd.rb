class Cd < ApplicationRecord
  has_one_attached :image
  attribute :new_image
  validates :title, presence: true, length: { maximum: 50 }
  validates :artist, presence: true, length: { maximum: 50 }
  validates :price, presence: true,
    numericality: { 
      only_integer: true,
      greater_than: 1
    }
  validates :release_date, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

  before_save do
    self.image = new_image if new_image
  end
end
