class InvisalignTrackersController < ApplicationController
  before_action :set_invisalign_tracker, only: [:show, :edit, :update, :destroy]

  # GET /invisalign_trackers
  # GET /invisalign_trackers.json
  def index
    @invisalign_trackers = InvisalignTracker.all
  end

  # GET /invisalign_trackers/1
  # GET /invisalign_trackers/1.json
  def show
  end

  # GET /invisalign_trackers/new
  def new
    @invisalign_tracker = InvisalignTracker.new
  end

  # GET /invisalign_trackers/1/edit
  def edit
  end

  # POST /invisalign_trackers
  # POST /invisalign_trackers.json
  def create
    @invisalign_tracker = InvisalignTracker.new(invisalign_tracker_params)

    respond_to do |format|
      if @invisalign_tracker.save
        format.html { redirect_to @invisalign_tracker, notice: 'Invisalign tracker was successfully created.' }
        format.json { render :show, status: :created, location: @invisalign_tracker }
      else
        format.html { render :new }
        format.json { render json: @invisalign_tracker.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def startOut
    puts("Here")
    tracker_id = 1
    
    params = {
      :out => Time.zone.now,
      :daynumber => 1,
      :tracker_id => 1
    }
    @invisalign_tracker = InvisalignTracker.new(params)
    
    #@invisalign_tracker = InvisalignTracker.new
    #@invisalign_tracker.out = DateTime.now
    #@invisalign_tracker.daynumber = 1
    #@invisalign_tracker.tracker_id = 1
    @invisalign_tracker.save
    
    respond_to do |format|
        format.html { redirect_to @invisalign_tracker, notice: 'Invisalign tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @invisalign_tracker }

    end

    #@invisalign_tracker = InvisalignTracker.new(invisalign_tracker_params)
    
  end
  
  def startIn
    puts("Here")
    @invisalign_tracker = InvisalignTracker.order(:created_at).where('in' => nil).last
    inTime=Time.zone.now 

    duration=((inTime - @invisalign_tracker.out) / 1.minute).round
    puts("Duration?: #{duration}")
        params = {
      :in => inTime,
      :duration => duration,
    }
    #@invisalign_tracker.update(params)
    respond_to do |format|
      if @invisalign_tracker.update(params)
        format.html { redirect_to @invisalign_tracker, notice: 'Invisalign tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @invisalign_tracker }
      else
        format.html { render :edit }
        format.json { render json: @invisalign_tracker.errors, status: :unprocessable_entity }
      end
    end
    
    
    

    #@invisalign_tracker = InvisalignTracker.new(invisalign_tracker_params)
  end

  # PATCH/PUT /invisalign_trackers/1
  # PATCH/PUT /invisalign_trackers/1.json
  def update
    respond_to do |format|
      if @invisalign_tracker.update(invisalign_tracker_params)
        format.html { redirect_to @invisalign_tracker, notice: 'Invisalign tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @invisalign_tracker }
      else
        format.html { render :edit }
        format.json { render json: @invisalign_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invisalign_trackers/1
  # DELETE /invisalign_trackers/1.json
  def destroy
    @invisalign_tracker.destroy
    respond_to do |format|
      format.html { redirect_to invisalign_trackers_url, notice: 'Invisalign tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invisalign_tracker
      @invisalign_tracker = InvisalignTracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invisalign_tracker_params
      params.require(:invisalign_tracker).permit(:in, :out, :duration, :daynumber, :tracker_id)
    end
end
