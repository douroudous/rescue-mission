require "pry"

class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
  end

  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:answer_id])

  end

  def update
    @answer = Answer.find(params[:answer_id])
    @answer.favorite = true
      redirect_to question_path

  end
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:description)
  end

end
