class Chat < ApplicationRecord
  
  #DM機能で
  belongs_to :user
  belongs_to :room

  validates :message, length: { in: 1..140 }
  
end
