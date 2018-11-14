class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(inst_id: params[:inst_id])
    redirect_to insts_url, notice: "#{favorite.inst.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to insts_url, notice: "#{favorite.inst.user.name}さんの投稿をお気に入り解除しました"
  end
  
  def index
    @favorites = current_user.favorites
  end
end
