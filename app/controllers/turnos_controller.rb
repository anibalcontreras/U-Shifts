class TurnosController < ApplicationController
  before_action :set_turno, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /turnos or /turnos.json
  def index
    @turnos = Turno.all
  end

  # GET /turnos/1 or /turnos/1.json
  def show
    # @chat = Chat.new
  end

  # GET /turnos/new
  def new
    # @turno = Turno.new
    @turno = current_user.turnos.build
    # @chat = Chat.new
  end

  # GET /turnos/1/edit
  def edit; end

  def search
    @turnos = Turno.where('direccion_salida ILIKE ?', "%#{params[:q]}%").or(
      Turno.where('direccion ILIKE ?', "%#{params[:q]}%")).or(
        Turno.where('tipo ILIKE ?', "%#{params[:q]}%")).or(
          Turno.where('comuna ILIKE ?', "%#{params[:q]}%"))
    #@turnos = Turno.where('comuna ILIKE ?', "%#{params[:q]}%")
    #@turnos = Turno.where('direccion ILIKE ?', "%#{params[:q]}%")
  end

  # POST /turnos or /turnos.json
  def create
    # @turno = Turno.new(turno_params)
    @turno = current_user.turnos.build(turno_params)

    respond_to do |format|
      if @turno.save
        Chat.create(:turno_id => @turno.id)
        format.html { redirect_to turno_url(@turno), notice: 'Se ha creado el Turno correctamente' }
        format.json { render :show, status: :created, location: @turno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
    @turno.users << User.find(current_user.id)
  end

  # PATCH/PUT /turnos/1 or /turnos/1.json
  def update
    respond_to do |format|
      if @turno.update(turno_params)
        format.html { redirect_to turno_url(@turno), notice: 'Se ha actualizado el Turno correctamente' }
        format.json { render :show, status: :ok, location: @turno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turnos/1 or /turnos/1.json
  def destroy
    @turno.destroy

    respond_to do |format|
      format.html { redirect_to turnos_url, notice: 'El Turno se ha destruido correctamente' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @turno = current_user.turnos.find_by(id: params[:id])
    redirect_to turnos_path, notice: 'No estas autorizado para editar este turno' if @turno.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_turno
    @turno = Turno.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def turno_params
    params.require(:turno).permit(:nombre_completo, :comuna, :direccion_salida, :dia_semana,
                                  :hora_salida, :limite_personas, :direccion, :descripcion, :tipo, :estado, :user_id)
  end
end
