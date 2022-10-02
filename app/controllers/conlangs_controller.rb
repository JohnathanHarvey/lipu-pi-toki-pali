class ConlangsController < ApplicationController
  before_action :set_conlang, only: %i[ show edit update destroy ]

  # GET /conlangs or /conlangs.json
  def index
    @conlangs = Conlang.all
  end

  # GET /conlangs/1 or /conlangs/1.json
  def show
  end

  # GET /conlangs/new
  def new
    @conlang = Conlang.new
  end

  # GET /conlangs/1/edit
  def edit
  end

  # POST /conlangs or /conlangs.json
  def create
    @conlang = Conlang.new(conlang_params)

    respond_to do |format|
      if @conlang.save
        format.html { redirect_to conlangs_path }
        format.json { render :show, status: :created, location: @conlang }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conlang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conlangs/1 or /conlangs/1.json
  def update
    respond_to do |format|
      if @conlang.update(conlang_params)
        format.html { redirect_to conlang_url(@conlang), notice: "Conlang was successfully updated." }
        format.json { render :show, status: :ok, location: @conlang }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conlang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conlangs/1 or /conlangs/1.json
  def destroy
    @conlang.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conlang
      @conlang = Conlang.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conlang_params
      params.fetch(:conlang, {}).permit(:name)
    end
end
