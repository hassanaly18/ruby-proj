# app/validators/article_quality_validator.rb
class ArticleQualityValidator < ActiveModel::Validator
  def validate(record)
    
    # Rule 1: Content should be significantly longer than the title
    if record.content.present? && record.title.present?
      if record.content.length < (record.title.length * 2)
        record.errors.add :content, "is too short relative to the title (must be at least double the length)"
      end
    end

    # Rule 2: Prevent clickbait titles
    clickbait_words = ["Amazing", "Unbelievable", "You won't believe"]
    if clickbait_words.any? { |word| record.title&.include?(word) }
      record.errors.add :title, "cannot contain clickbait phrases"
    end
  end
end