class AnswerController < ApplicationController
  def create
    Answer.create(post_params)
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end