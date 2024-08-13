class Stock < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
