class Dealing < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories

  validates :name, presence: true
  validates :amount, presence: true, comparison: { greater_than: 0 }, numericality: true
end
