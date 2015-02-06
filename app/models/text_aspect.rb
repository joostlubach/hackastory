class TextAspect < Aspect

  validates_presence_of :text

  def text
    text_content
  end
  def text=(text)
    self.text_content = text
  end

end