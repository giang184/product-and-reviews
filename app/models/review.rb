class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, maximum: 250
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates_numericality_of :rating, greater_than_or_equal_to: 0
  before_save(:titleize_review)

  private
    def titleize_review
      self.author = self.author.titleize
    end
end