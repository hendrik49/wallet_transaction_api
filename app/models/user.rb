class User < ApplicationRecord
  has_one :wallet
  has_and_belongs_to_many :teams

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
