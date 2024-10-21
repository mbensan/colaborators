include Pagy::Backend

class ColaboratorsController < ApplicationController

  Pagy::DEFAULT[:items] = 8
  before_action :set_colaborator, only: %i[ show edit update destroy ]

  def search
  end

  def preview
    @id = params[:id]
  end
  # GET /colaborators or /colaborators.json
  def index
    #@colaborators = Colaborator.all
    # se pagina el resultado con PAGY
    @pagy, @colaborators = pagy(Colaborator.all)

    if params[:query_text].present?
      @colaborators = Colaborator.search_full_text(params[:query_text])
    end
  end

  # GET /colaborators/1 or /colaborators/1.json
  def show
  end

  # GET /colaborators/new
  def new
    @colaborator = Colaborator.new
  end

  # GET /colaborators/1/edit
  def edit
  end

  # POST /colaborators or /colaborators.json
  def create
    @colaborator = Colaborator.new(colaborator_params)

    respond_to do |format|
      if @colaborator.save
        format.html { redirect_to @colaborator, notice: "Colaborator was successfully created." }
        format.json { render :show, status: :created, location: @colaborator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @colaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaborators/1 or /colaborators/1.json
  def update
    respond_to do |format|
      if @colaborator.update(colaborator_params)
        format.html { redirect_to @colaborator, notice: "Colaborator was successfully updated." }
        format.json { render :show, status: :ok, location: @colaborator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @colaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaborators/1 or /colaborators/1.json
  def destroy
    @colaborator.destroy!

    respond_to do |format|
      format.html { redirect_to colaborators_path, status: :see_other, notice: "Colaborator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborator
      @colaborator = Colaborator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colaborator_params
      params.require(:colaborator).permit(:name, :email, :address)
    end
end
