class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # before_action :correct_user, only: %i[edit update destroy]

  # GET /requests or /requests.json
  def index
    @turno = Turno.find(params[:turno_id])
    @requests = Request.all
    @users = User.all
    
   #3 @user = User.find(params[:user_id])
  end

  # GET /requests/1 or /requests/1.json
  def show
    @member = Member.new
    @turno = Turno.find(@request.turno_id)
    @user = User.find(@request.solicitante_id)
  end

  # GET /requests/new
  def new
    @turno = Turno.find(params[:turno_id])
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests or /requests.json
  def create
    @request = Request.create(request_params)
    @turno = Turno.find(@request.turno_id)
    # @request = current_user.requests.build(request_params)

    respond_to do |format|
      if @request.save
        format.html do
          redirect_to turno_url(@turno), notice: 'Solicitud fue enviada'
        end
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html do
          redirect_to request_url(@request), notice: 'Request was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @turno = Turno.find(@request.turno_id)
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_path(turno_id: @turno.id), notice: 'Solicitud fue rechazada' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:descripcion, :turno_id, :solicitante_id)
  end
  '
  def correct_user
    @request = current_user.requests.find_by(id: params[:id])
    if @request.nil?
      redirect_to requests_path,
                  notice: No estás autorizado para solicitar este turno
    end
  end
  '
end
