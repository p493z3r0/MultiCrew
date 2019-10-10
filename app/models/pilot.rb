class Pilot < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
end
