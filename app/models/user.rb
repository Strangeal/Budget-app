class User < ApplicationRecord
  has_many :categories
  has_many :dealings

  validates :name, presence: true
end
