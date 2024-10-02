class Tag < ApplicationRecord
  has_many :book_relationships, dependent: :destroy
  has_many :books, through: :book_relationships
  validates :name, presence: true, uniqueness: true
end
