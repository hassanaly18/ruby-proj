class Book < ApplicationRecord
  before_create :greeting_message
  after_commit   :check_harry
  after_update :show_author 

  def greeting_message
    puts "Called before making the book object"
  end

  def check_harry
    if self.author&.include?("Harry")
      puts "The author is a harry"
    end
  end

  def show_author
    puts "The author is #{self.author}"
  end
end