class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    # @answer = Answer.find(params[:answer_id])
    @response = @question.responses.create!(response_params)
    respond_to do |format|
      format.html { redirect_to @question }
      format.js
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    redirect_to(@question) 
  end

  private

  def response_params
    params.require(:response).permit(:body)
  end
end
