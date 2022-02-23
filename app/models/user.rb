class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :reviews
  has_many :favorites
  has_many :likes, through: :favorites, source: :review
  
  def favorite(other_review)
    self.favorites.find_or_create_by(review_id: other_review.id)
  end

def unfavorite(other_review)
    favorite = self.favorites.find_by(review_id: other_review.id)
    favorite.destroy if favorite
end

def likes?(other_review)
   self.likes.include?(other_review)
end

end
