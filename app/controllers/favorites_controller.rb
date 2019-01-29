class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:update, :show, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @favorites = Favorite.all
    json_response(@favorites)
  end

  def create
   @favorite = Favorite.create!(favorite_params)
   json_response(@favorite, :created)
  end

  def update
    @favorite.update(favorite_params)
    head :no_content
  end

  def destroy
    @favorite.destroy
    head :no_content
  end

  def show
    json_response(@favorite)
  end

  private

  def favorite_params
    params.permit(:comment, :user_id, :omdbid, :favorite, :rating)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
