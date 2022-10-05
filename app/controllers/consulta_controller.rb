class ConsultaController < ApplicationController
  before_action :set_consultum, only: %i[ show edit update destroy ]

  # GET /consulta or /consulta.json
  def index
    @consulta = Consultum.all.sort_by(&:data_hora)
  end

  # GET /consulta/1 or /consulta/1.json
  def show
  end

  # GET /consulta/new
  def new
    @consultum = Consultum.new
  end

  # GET /consulta/1/edit
  def edit
  end

  # POST /consulta or /consulta.json
  def create
    @consultum = Consultum.new(consultum_params)
    # se a hora for inconpativel com o horario de atendimento do dentista
    if  params["consultum"]["dentistum_id"] != ""
      #hora inconpativel
      if @consultum.data_hora.hour > @consultum.dentistum.horario_fim.hour || @consultum.data_hora.hour < @consultum.dentistum.horario_inicio.hour || (@consultum.data_hora.hour > (@consultum.dentistum.horario_fim - 1.hour).hour)
        respond_to do |format|
          format.html { redirect_to new_consultum_url, notice: "O horario de atendimento do dentista #{@consultum.dentistum.nome} é das #{@consultum.dentistum.horario_inicio.hour}h as #{@consultum.dentistum.horario_fim.hour}h (Marcar consultas até 30 min antes do fim do expediente)" }
          format.json { render json: @consultum.errors, status: :unprocessable_entity }
        end
      else

        if @consultum.data_hora.min == 30 && @consultum.data_hora.hour == @consultum.dentistum.horario_fim.hour
          respond_to do |format|
            format.html { redirect_to new_consultum_url, notice: "O horario de atendimento do dentista #{@consultum.dentistum.nome} é das #{@consultum.dentistum.horario_inicio.hour}h as #{@consultum.dentistum.horario_fim.hour}h" }
            format.json { render json: @consultum.errors, status: :unprocessable_entity }
          end
        else
          respond_to do |format|
            if @consultum.save
              format.html { redirect_to @consultum, notice: "Consultum was successfully created." }
              format.json { render :show, status: :created, location: @consultum }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @consultum.errors, status: :unprocessable_entity }
            end
          end
        end
      end
    else
      respond_to do |format|
        if @consultum.save
          format.html { redirect_to @consultum, notice: "Consultum was successfully created." }
          format.json { render :show, status: :created, location: @consultum }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @consultum.errors, status: :unprocessable_entity }
        end
      end
    end


  end

  # PATCH/PUT /consulta/1 or /consulta/1.json
  def update
    if  params["consultum"]["dentistum_id"] != ""
      #hora inconpativel
      if @consultum.data_hora.hour > @consultum.dentistum.horario_fim.hour || @consultum.data_hora.hour < @consultum.dentistum.horario_inicio.hour || (consultum_params["data_hora(4i)"].to_i > (@consultum.dentistum.horario_fim - 1.hour).hour)
        respond_to do |format|
          format.html { redirect_to edit_consultum_path(@consultum.id) , notice: "O horario de atendimento do dentista #{@consultum.dentistum.nome} é das #{@consultum.dentistum.horario_inicio.hour}h as #{@consultum.dentistum.horario_fim.hour}h (Marcar consultas até 30 min antes do fim do expediente)" }
          format.json { render json: @consultum.errors, status: :unprocessable_entity }
        end
      else

        if @consultum.data_hora.min == 30 && @consultum.data_hora.hour == @consultum.dentistum.horario_fim.hour
          respond_to do |format|
            format.html { redirect_to new_consultum_url, notice: "O horario de atendimento do dentista #{@consultum.dentistum.nome} é das #{@consultum.dentistum.horario_inicio.hour}h as #{@consultum.dentistum.horario_fim.hour}h" }
            format.json { render json: @consultum.errors, status: :unprocessable_entity }
          end
        else
          respond_to do |format|
            if @consultum.update(consultum_params)
              format.html { redirect_to @consultum, notice: "Consultum was updated successfully." }
              format.json { render :show, status: :created, location: @consultum }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @consultum.errors, status: :unprocessable_entity }
            end
          end
        end
      end
    else
      respond_to do |format|
        if @consultum.save
          format.html { redirect_to @consultum, notice: "Consultum was successfully created." }
          format.json { render :show, status: :created, location: @consultum }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @consultum.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /consulta/1 or /consulta/1.json
  def destroy
    @consultum.destroy

    respond_to do |format|
      format.html { redirect_to consulta_url, notice: "Consultum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultum
      @consultum = Consultum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultum_params
      params.require(:consultum).permit(:data_hora, :dentistum_id, :paciente_id)
    end
end