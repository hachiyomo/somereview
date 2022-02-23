class Review < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :users, through: :favorites
  
end
