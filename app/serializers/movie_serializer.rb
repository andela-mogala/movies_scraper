class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :description, :video_url
end
