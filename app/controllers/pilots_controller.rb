class PilotsController < ApplicationController
  before_action :set_pilot, only: [:show, :edit, :update, :destroy]

  # GET /pilots
  # GET /pilots.json
  def index
    @Values = ['Newbie', 'Limited Experience', "Experienced", "Expert Pilot"]

    @pilots = Pilot.all
  end

  def add_friend
    pilot = Pilot.find(params[:pilot_id])
    if !pilot.blank?
      user = Pilot.find(current_user.id)
      friendships = Friendship.new

      user.friends.push(pilot)
      redirect_to :action => "index"

    else
    end

  end

  # GET /pilots/1
  # GET /pilots/1.json
  def show
    @Values = ['Newbie', 'Limited Experience', "Experienced", "Expert Pilot"]

  end

  # GET /pilots/new
  def new
    @pilot = Pilot.new
    @Values = ['Newbie', 'Limited Experience', "Experienced", "Expert Pilot"]


  end

  # GET /pilots/1/edit
  def edit
    @Values = ['Newbie', 'Limited Experience', "Experienced", "Expert Pilot"]

  end

  # POST /pilots
  # POST /pilots.json
  def create
    @Values = ['Newbie', 'Limited Experience', "Experienced", "Expert Pilot"]

    @pilot = Pilot.new(pilot_params)
    @pilot.user_id = current_user.id
    respond_to do |format|
      if @pilot.save
        format.html { redirect_to @pilot, notice: 'Pilot was successfully created.' }
        format.json { render :show, status: :created, location: @pilot }
      else
        format.html { render :new }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pilots/1
  # PATCH/PUT /pilots/1.json
  def update
    respond_to do |format|
      if @pilot.user_id != current_user.id
        format.html { redirect_to @pilot, alert: 'Access denied' }
      else
      if @pilot.update(pilot_params)
        format.html { redirect_to @pilot, notice: 'Pilot was successfully updated.' }
        format.json { render :show, status: :ok, location: @pilot }
      else
        format.html { render :edit }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
   end
  end

  # DELETE /pilots/1
  # DELETE /pilots/1.json
  def destroy
    @pilot.destroy
    respond_to do |format|
      format.html { redirect_to pilots_url, notice: 'Pilot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pilot
      @pilot = Pilot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pilot_params
      params.require(:pilot).permit(:name, :lastname, :hours, :about, :simulator, :user_id, :experience)
    end
end
