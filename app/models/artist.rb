class Artist < ApplicationRecord
  has_many :cds
  has_one_attached :image
  attribute :new_image
  validates :name, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 5000 }

  before_save do
    self.image = new_image if new_image
  end
end
