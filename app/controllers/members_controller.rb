class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /members or /members.json
  def index
    @turno = Turno.find(params[:turno_id])
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
    @turno = Turno.find(@member.turno_id)
    @turno.requests.each do |request|
      if request.solicitante_id == @member.user_id
        request.destroy
      end
    end
  end

  # GET /members/new
  def new
    @member = Member.new
    @user = params[:user_id]
    @turno = params[:turno_id]
   #@user = User.find(params[:user_id])
    #@turno = Turno.find(params[:turno_id])
    @request = Request.find(params[:request_id])
    # @turno.users << User.find(user_id)
    # @turno.users << User.find(params[:user_id])
    @request.destroy
  end

  # GET /members/1/edit
  def edit; end

  # POST /members or /members.json
  def create
    @requests = Request.all
    @member = Member.create(member_params)
    
    respond_to do |format|
      if @member.save

        format.html { redirect_to member_url(@member), notice: 'Solicitud fue aceptada' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:user_id, :turno_id)
  end
end
