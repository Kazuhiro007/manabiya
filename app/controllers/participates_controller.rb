class ParticipatesController < ApplicationController
  def index
    @participate_lessons = current_user.participate_lessons
  end

  def create
    participate = Participate.new
    participate.user_id = current_user.id
    participate.lesson_id = params[:lesson_id]
    if participate.save
      redirect_to lessons_path, notice: '申請済みに追加しました'
    else
      redirect_to lessons_path, notice: '申請に失敗しました'
    end
  end

  def destroy
    participate = Participate.find_by(user_id: current_user.id, lesson_id: params[:lesson_id])
    participate.destroy
    redirect_to lessons_path, notice: '参加を取り消しました'
  end
end
