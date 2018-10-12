module ApplicationHelper

  # @param [Url] url
  # @return [String] Full url
  def shortened_url(url)
    "#{root_url}#{url.shortened_code}"
  end
end
