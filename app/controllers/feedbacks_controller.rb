# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.submit
      redirect_to new_feedback_path, notice: "Thank you for your feedback!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :content, :email)
  end
end