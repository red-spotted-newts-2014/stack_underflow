class ResponsesController < ActionController::Base

  def new
    @response = Response.new
  end

  # def create
  #   @response = Response.create(response_params)
  # end

  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.create!(params[:response])
    respond_to do |format|
      format.html { redirect_to @question }
      format.js
    end
    # render :json => @response.to_json
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    @response.update(response_params)
    if @response.save(response_params)
      redirect_to(@response)
    else
      render :edit
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
  end

  private

  def response_params
    params.require(:response).permit(:responsable_type,:body)
  end
end
