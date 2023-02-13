class Dealing < ApplicationRecord
  belongs_to :author
  has_many :categories

  validates :name, presence: true
  validates :icon, presence: true
end
