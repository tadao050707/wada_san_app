class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.html { render :index }
        format.js { render :index }
        # format.html { redirect_to question_path(@question), notice: '投稿完了' }
      else
        format.html { redirect_to question_path(@question), notice: '投稿できませんでした...' }
        format.js { redirect_to question_path(@question), notice: '投稿できませんでした...' }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      flash.now[:notice] = '回答が削除されました'
      format.js { render :index }
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:question_id, :content).merge(user_id: current_user.id)
  end

  # def set_question
  #   @question = Question.find(params[:question_id])
  # end
end
