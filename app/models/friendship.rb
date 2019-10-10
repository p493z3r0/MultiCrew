class Friendship < ApplicationRecord
    belongs_to :pilot
    belongs_to :friend, :class_name => 'Pilot'
end
