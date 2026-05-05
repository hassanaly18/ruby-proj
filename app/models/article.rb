class Article < ApplicationRecord
  validates :title, presence: {strict: true}
  validates :slug, absence: true, if: :is_draft? 
  validates :confirm_rights, acceptance: {message: "must be confirmed"}
  validates :slug, confirmation: { case_sensitive: false }
  validates :slug_confirmation, presence: true, if: :slug_changed?
  # INCLUSION: The status MUST be one of these three.
  validates :status, inclusion: { 
    in: %w(Draft Published Archived),
    message: "%{value} is not a valid status" 
  }
  # EXCLUSION: The slug CANNOT be any of these reserved words.
  validates :slug, exclusion: { 
    in: %w(admin login logout settings help),
    message: "%{value} is a reserved word and cannot be used as a slug" 
  }
  validates :slug, uniqueness:{case_sensitive: false}
  validates_with ArticleQualityValidator, banned_words: ["Click here", "Win big"]
  validates :slug, presence: true, slug_format: true
  validate :title_is_not_all_caps

  enum :status, { 
    draft: "Draft", 
    published: "Published", 
    archived: "Archived" 
  }

  # 2. SCOPES (The Query Interface bread and butter)
  # Like 'in_print' in your guide
  scope :featured, -> { where(featured: true) }
  
  # Like 'old' in your guide
  scope :from_this_year, -> { where(published_at: Time.now.beginning_of_year..Time.now.end_of_year) }
  
  # Like 'costs_more_than' (takes an argument)
  scope :long_read, ->(min_words) { where("word_count > ?", min_words) }

  private
  def is_draft?
    status == "Draft"
  end

  def title_is_not_all_caps
    if title.present? && title == title.upcase 
      errors.add(:title, "cannot be all capital letters. Stop shouting!")
    end
  end
end
