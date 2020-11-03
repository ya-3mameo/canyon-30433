class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options precence: true do
    validates :title
    validates :concept
    validates :price
    validates :prefecture
    validates :visit_day
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end
