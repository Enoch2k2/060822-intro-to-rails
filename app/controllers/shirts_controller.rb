class ShirtsController < ApplicationController
  before_action :set_shirt, only: [:show, :update, :destroy]

  # GET /shirts
  def index
    @shirts = Shirt.all

    render json: @shirts, include: [:color_type]
  end

  # GET /shirts/1
  def show
    render json: @shirt
  end

  # POST /shirts
  def create
    @shirt = Shirt.new(shirt_params)

    if @shirt.save
      render json: @shirt, status: :created, location: @shirt
    else
      render json: @shirt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shirts/1
  def update
    if @shirt.update(shirt_params)
      render json: @shirt
    else
      render json: @shirt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shirts/1
  def destroy
    @shirt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shirt
      @shirt = Shirt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shirt_params
      params.require(:shirt).permit(:color)
    end
end
