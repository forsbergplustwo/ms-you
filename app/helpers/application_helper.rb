module ApplicationHelper

  def it(key, **opts)
    return key if current_user&.preferred_language == "English"
    text = super(key, **opts)
    text = text[0..-2] if text[-1] == "." && text.length < 200
    text
  end

end
