class Item < ApplicationRecord
  
  has_one :user_item
  belongs_to :user
  # , dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :days


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :days_id
  end

  with_options presence: true do
    validates :name
    validates :price
    validates :explanation
    validates :image
  end

  validates :price, format: {with: /\A[0-9]+\z/}, 
                    numericality: { :greater_than_or_equal_to  => 300, :less_than_or_equal_to => 9999999  }
end
