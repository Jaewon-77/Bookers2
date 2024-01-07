class Room < ApplicationRecord
  #DM機能で追加
  has_many :user_rooms
  has_many :chats
  
end
