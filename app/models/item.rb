class Item < ApplicationRecord
  
  belongs_to :note
  
  validates :title, presence: true
  
end
