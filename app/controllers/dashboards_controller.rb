class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index
    @dashboards = Dashboard.all
    if Pilot.where(user_id: current_user.id).empty?
      redirect_to "/pilots/new"
    end
    @flights = Flight.where(cop_pilot_id: current_user.id).or(Flight.where(pic_pilot_id: current_user.id))

  end

  


end
