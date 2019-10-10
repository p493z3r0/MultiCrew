class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :provide_pilot
    def provide_pilot 
        if current_user == nil
            return
        end
       if Pilot.where(id: current_user.id).empty?
            return
       end


        
        @current_user_pilot = Pilot.find(current_user.id)
        @current_user_pilot_edit_path = "/pilots/" + @current_user_pilot.id.to_s + "/edit"
    end
end
