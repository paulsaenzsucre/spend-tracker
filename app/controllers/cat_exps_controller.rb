class CatExpsController < ApplicationController
  before_action :set_cat_exp, only: %i[show edit update destroy]

  # GET /cat_exps or /cat_exps.json
  def index
    @category = Category.find(params[:category_id])
    @cat_exps = CatExp.where(category_id: params[:category_id]).order(created_at: :desc)
  end

  # GET /cat_exps/1 or /cat_exps/1.json
  def show; end

  # GET /cat_exps/new
  def new
    @cat_exp = CatExp.new
  end

  # GET /cat_exps/1/edit
  def edit; end

  # POST /cat_exps or /cat_exps.json
  def create
    @cat_exp = CatExp.new(cat_exp_params)

    respond_to do |format|
      if @cat_exp.save
        format.html { redirect_to cat_exp_url(@cat_exp), notice: 'Cat exp was successfully created.' }
        format.json { render :show, status: :created, location: @cat_exp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat_exp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_exps/1 or /cat_exps/1.json
  def update
    respond_to do |format|
      if @cat_exp.update(cat_exp_params)
        format.html { redirect_to cat_exp_url(@cat_exp), notice: 'Cat exp was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_exp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat_exp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_exps/1 or /cat_exps/1.json
  def destroy
    @cat_exp.destroy

    respond_to do |format|
      format.html { redirect_to cat_exps_url, notice: 'Cat exp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cat_exp
    @cat_exp = CatExp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cat_exp_params
    params.require(:cat_exp).permit(:category_id, :expense_id)
  end
end
