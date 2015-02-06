class ImageAspect < Aspect

  validates_presence_of :image_data

  def image_data
    binary_content
  end
  def image_data=(data)
    self.binary_content = data
  end

end