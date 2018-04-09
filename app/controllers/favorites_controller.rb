class FavoritesController < ApplicationController
  def index
    @favorite_lessons = current_user.favorite_lessons
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.lesson_id = params[:lesson_id]
    if favorite.save
      redirect_to lessons_path, notice: 'お気に入りに登録しました'
    else
      redirect_to lessons_path, notice: 'お気に入りに登録に失敗しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, lesson_id: params[:lesson_id])
    favorite.destroy
    redirect_to lessons_path, notice: 'お気に入りから消去しました'
  end
end
