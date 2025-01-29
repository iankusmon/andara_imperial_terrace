include Rails.application.routes.url_helpers

class ArticleSectionSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :description
  )

  def image_url
    Rails.application.routes.url_helpers.url_for(object.image)
  end

end
