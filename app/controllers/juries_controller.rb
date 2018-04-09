class JuriesController < ApplicationController
  before_action :set_jury, only: [:show, :edit, :update, :destroy]

  # GET /juries
  # GET /juries.json
  def index
    @juries = Jury.all
  end

  # GET /juries/1
  # GET /juries/1.json
  def show
  end

  # GET /juries/new
  def new
    @jury = Jury.new
  end

  # GET /juries/1/edit
  def edit
  end

  # POST /juries
  # POST /juries.json
  def create
    @jury = Jury.new(jury_params)

    respond_to do |format|
      if @jury.save
        format.html { redirect_to @jury, notice: 'Jury was successfully created.' }
        format.json { render :show, status: :created, location: @jury }
      else
        format.html { render :new }
        format.json { render json: @jury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juries/1
  # PATCH/PUT /juries/1.json
  def update
    respond_to do |format|
      if @jury.update(jury_params)
        format.html { redirect_to @jury, notice: 'Jury was successfully updated.' }
        format.json { render :show, status: :ok, location: @jury }
      else
        format.html { render :edit }
        format.json { render json: @jury.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juries/1
  # DELETE /juries/1.json
  def destroy
    @jury.destroy
    respond_to do |format|
      format.html { redirect_to juries_url, notice: 'Jury was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jury
      @jury = Jury.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jury_params
      params.require(:jury).permit(:name, :location_id)
    end
end
