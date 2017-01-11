require "pry"
class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :asc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
    # if Answer.find(params[:answer_id])
    #  @question.favorite = params[:answer_id]
    # end
  end

  def new
    @question = Question.new
    @errors = @question.errors
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      @errors = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @errors = @question.errors
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to questions_path
    else
      @errors = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :description)
  end

end
