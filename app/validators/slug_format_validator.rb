class SlugFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 'record' is the Article instance
    # 'attribute' is :slug
    # 'value' is whatever the user typed in
    
    unless value =~ /\A[a-z0-9-]+\z/
      record.errors.add attribute, (options[:message] || "can only contain lowercase letters, numbers, and hyphens")
    end
  end
end