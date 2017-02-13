class JstimersController < ApplicationController
  before_action :set_jstimer, only: [:show, :edit, :update, :destroy]

  # GET /jstimers
  # GET /jstimers.json
  def index
    @jstimers = Jstimer.all
  end

  # GET /jstimers/1
  # GET /jstimers/1.json
  def show
  end

  # GET /jstimers/new
  def new
    @jstimer = Jstimer.new
  end

  # GET /jstimers/1/edit
  def edit
  end

  # POST /jstimers
  # POST /jstimers.json
  def create
    @jstimer = Jstimer.new(jstimer_params)

    respond_to do |format|
      if @jstimer.save
        format.html { redirect_to @jstimer, notice: 'Jstimer was successfully created.' }
        format.json { render :show, status: :created, location: @jstimer }
      else
        format.html { render :new }
        format.json { render json: @jstimer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jstimers/1
  # PATCH/PUT /jstimers/1.json
  def update
    respond_to do |format|
      if @jstimer.update(jstimer_params)
        format.html { redirect_to @jstimer, notice: 'Jstimer was successfully updated.' }
        format.json { render :show, status: :ok, location: @jstimer }
      else
        format.html { render :edit }
        format.json { render json: @jstimer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jstimers/1
  # DELETE /jstimers/1.json
  def destroy
    @jstimer.destroy
    respond_to do |format|
      format.html { redirect_to jstimers_url, notice: 'Jstimer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jstimer
      @jstimer = Jstimer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jstimer_params
      params.fetch(:jstimer, {})
    end
end
