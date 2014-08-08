class AnswersController < ApplicationController
  def create
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end