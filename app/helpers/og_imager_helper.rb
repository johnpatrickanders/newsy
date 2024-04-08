module OgImagerHelper
  def article_link_preview article
    uri = URI.parse('https://your_app_name.herokuapp.com/ogimage')
    uri.query = URI.encode_www_form(
      title: article.title,
      'images[]': article.tags.collect(&:image),
      # timestamp: article.created_at.to_formatted_s(:short),
    )
    uri.to_s
  end
end
