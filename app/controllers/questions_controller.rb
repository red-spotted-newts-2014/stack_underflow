class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def unanswered
    @questions = Question.unanswered
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      # @question.tags.find_or_create_by(name: tag)
      params[:tags].split(", ").each { |tag| QuestionTag.create(question_id: @question.id, tag_id: Tag.find_or_create_by(name: tag).id)}
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_from current_user
    redirect_to @question
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_from current_user
    redirect_to @question
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :tags)
  end

end
