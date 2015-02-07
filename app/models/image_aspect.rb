class ImageAspect < Aspect

  def image_url
    text_content
  end
  def image_url=(url)
    self.text_content = url
  end

  def image_data
    binary_content
  end
  def image_data=(data)
    self.binary_content = data
  end

end