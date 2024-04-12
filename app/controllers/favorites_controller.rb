class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    flash[:success] = 'お気に入りを登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    current_user.unfavorite(@micropost)
    flash[:success] = 'お気に入りを削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
