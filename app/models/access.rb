class Access < ApplicationRecord
  belongs_to :tweet

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :access_plan
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end
