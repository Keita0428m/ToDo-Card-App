class Card < ApplicationRecord
  belongs_to :list
  
  validates :title, length: { in: 1..255 }, presence: true
  validates :memo,  length: { maximum: 1000 }
end
