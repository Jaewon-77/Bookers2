class UserRoom < ApplicationRecord
  
  #DM機能で追加
  belongs_to :user
  belongs_to :room
  
end
