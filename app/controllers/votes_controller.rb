class AnswersController < ApplicationController
  def create
  end

  private

  def answer_params
    params.require(:vote).permit(:up?)
  end
end