class Task < ApplicationRecord

  belongs_to :new_user

  validates :priority_level, numericality: true, allow_nil: true
  validates :category_code, length: {is: 5}, allow_bank: true
  validates :title, presence: { message: "cannot be forgotten! How will you know what to do?" }
  validates :estimated_hours, numericality: { 
    message: "%{value} is not a valid number of hours. Please try again." 
  }
  validates :admin_id, presence: true, on: :create
  validates :completion_score, presence: true, on: :update

  after_create :log_creation

  private

  def log_creation
    Log.create(message: "Task '#{title}' was created.")
  end
end

class Log < ApplicationRecord
  include ActiveRecord::Suppressor
end