class NewUser < ApplicationRecord
  validates :name, presence: true 
  after_create :log_new_user 
  has_many :tasks, dependent: :destroy 

  private
    def log_new_user
      puts "A new user was registered"
    end
end
