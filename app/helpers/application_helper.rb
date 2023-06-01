module ApplicationHelper

  def it(key, **opts)
    return key if current_user&.preferred_language == "English"
    text = super(key, **opts)
    text = text[0..-2] if text[-1] == "." && text.length < 200
    text
  end

  def nav_item_selected?(url)
    url_part = url.include?("?") ? url.split("?").first : url
    path_part = request.path.include?("?") ? request.path.split("?").first : request.path
    url_part == path_part
  end

end
