class ResenasController < ApplicationController
  before_action :set_resena, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /resenas or /resenas.json
  def index
    @resenas = Resena.all
    @turno = Turno.find(params[:turno_id])
    @user = User.find(params[:user_id])
  end

  # GET /resenas/1 or /resenas/1.json
  def show
    # @turno = Turno.find(params[:turno_id])
    # @user = User.find(params[:user_id])
  end

  # GET /resenas/new
  def new
    @resena = Resena.new
    @turno = Turno.find(params[:turno_id])
    @user = User.find(params[:user_id])
  end

  # GET /resenas/1/edit
  def edit
    @turno = Turno.find(params[:turno_id])
    @user = User.find(params[:user_id])
  end

  # POST /resenas or /resenas.json
  def create
    @resena = Resena.create(resena_params)

    respond_to do |format|
      if @resena.save
        format.html { redirect_to resena_url(@resena), notice: 'Resena was successfully created.' }
        format.json { render :show, status: :created, location: @resena }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resena.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resenas/1 or /resenas/1.json
  def update
    respond_to do |format|
      if @resena.update(resena_params)
        format.html { redirect_to resena_url(@resena), notice: 'Resena was successfully updated.' }
        format.json { render :show, status: :ok, location: @resena }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resena.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resenas/1 or /resenas/1.json
  def destroy
    @resena.destroy

    respond_to do |format|
      format.html { redirect_to resenas_url, notice: 'Resena was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resena
    @resena = Resena.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def resena_params
    params.require(:resena).permit(:valoracion, :descripcion, :user_id, :turno_id)
  end
end
