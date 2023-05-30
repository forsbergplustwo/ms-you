module ApplicationHelper
  def it(key, **opts)
    text = super(key, **opts)
    text = text[0..-2] if text[-1] == "." && text.length < 200
    text
  end
end
