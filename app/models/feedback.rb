# app/models/feedback.rb
class Feedback
  include ActiveModel::API
  include ActiveModel::Attributes # Add this!

  # Instead of attr_accessor, we use the attribute macro
  attribute :email, :string
  attribute :content, :string
  attribute :urgency, :integer, default: 1
  attribute :callback_requested, :boolean, default: false
  attribute :submitted_at, :datetime, default: -> { Time.current }

  validates :email, :content, presence: true
  validates :urgency, numericality: { in: 1..5 }

  def submit
    return false unless valid?
    true
  end
end