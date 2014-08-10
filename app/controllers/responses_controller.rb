class ResponsesController < ActionController::Base
  before_filter :load

  def load
    @responses = Response.all
    @response = Response.new
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.create(response_params)
    render :json => @response.to_json
    redirect to @question
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
