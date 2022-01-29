class GreeksController < ApplicationController
  before_action :set_greek, only: [:show, :update, :destroy]

  # GET /greeks
  def index
    @greeks = Greek.all

    render json: @greeks
  end

  # GET /greeks/1
  def show
    render json: @greek
  end

  # POST /greeks
  def create
    @greek = Greek.new(greek_params)

    if @greek.save
      render json: @greek, status: :created, location: @greek
    else
      render json: @greek.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /greeks/1
  def update
    if @greek.update(greek_params)
      render json: @greek
    else
      render json: @greek.errors, status: :unprocessable_entity
    end
  end

  # DELETE /greeks/1
  def destroy
    @greek.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greek
      @greek = Greek.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def greek_params
      params.require(:greek).permit(:author, :message)
    end
end
