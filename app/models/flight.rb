class Flight < ApplicationRecord
    has_one :pic_pilot, :class_name => "Pilot", :foreign_key => 'pic_pilot_id'
    has_one :cop_pilot, :class_name => "Pilot", :foreign_key => 'cop_pilot_id'
end
