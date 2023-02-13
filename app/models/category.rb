class Category < ApplicationRecord
  belongs_to :author
  has_many :dealings
end
