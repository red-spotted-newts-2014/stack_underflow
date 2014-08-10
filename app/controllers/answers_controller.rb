class AnswersController < ApplicationController
  @current_user = User.first

  def create
    Answer.create(post_params)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
  end

  def upvote
    @answer = answer.find(params[:id])
    @answer.liked_by @current_user
    redirect_to @answer
  end

  def downvote
    @answer = answer.find(params[:id])
    @answer.downvote_from @current_user
    redirect_to @answer
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
