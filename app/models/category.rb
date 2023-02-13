class Category < ApplicationRecord
  belongs_to :author
  has_many :dealings

  validates :name, presence: true
  validates :amount, presence: true, comparison: { greater_than: 0 }, numericality: { only_integer: true }
end
