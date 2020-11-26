class Order < ApplicationRecord
  
  belongs_to :user_item, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

 
end
