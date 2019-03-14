module ArtistsHelper
  def show_artist_image(artist)
    if artist.image.attached?
      image_tag artist.image.variant(resize: "300x300"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end
end
