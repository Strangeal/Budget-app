class Dealing < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_dealings, dependent: :destroy
  has_many :categories, through: :category_dealings

  validates :name, presence: true
  validates :amount, presence: true, comparison: { greater_than: 0 }, numericality: true
end
