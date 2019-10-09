class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  helper_method :set_copilot

  # GET /flights/1/edit
  def edit
  end
  def set_copilot
    flight = Flight.find(params[:flight_id])
    if flight == nil
      redirect_to :action => "show", :id => params[:flight_id]
      puts "Flight is nil"
    else
      if flight.cop_pilot_id != nil
        redirect_to :action => "show", :id => params[:flight_id]
        puts "Copilot is not nil"

      else
        flight.cop_pilot_id = current_user.id
        flight.save
        redirect_to :action => "show", :id => params[:flight_id]
      end
    end
    # flight.cop_pilot_id = current_user.id
  end
  def setPilotInCommand
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    
    respond_to do |format|
      if @flight.pic_pilot_id != current_user.id
        format.html { redirect_to @flight, alert: 'You are not authorized to edit this flight' }
        format.json { render :show, status: :unprocessable_entity, location: @flight }
      else
        if @flight.update(flight_params)
          format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
          format.json { render :show, status: :ok, location: @flight }
        else
          format.html { render :edit }
          format.json { render json: @flight.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight).permit(:from_airport, :to_airport, :pic_pilot_id, :cop_pilot_id, :date, :description, :flightplan, :aircraft)
    end
end
