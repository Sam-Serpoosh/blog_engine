class Post
  attr_reader :title, :content, :published_at

  def initialize(attr)
    attr.each do |key, value|
      send("#{key.to_s}=", value)
    end
  end

  def publish(time=Time)
    @published_at = time.now
  end

  private
    def title=(title)
      @title = title
    end

    def content=(content)
      @content = content
    end
end
