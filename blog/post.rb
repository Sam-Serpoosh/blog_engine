class Post
  attr_reader :title, :body, :published_at

  def initialize(title, body)
    @title = title
    @body = body
    publish
  end

  def eql?(other)
    return false if !other.is_a?(Post)
    return @title.eql?(other.title) && 
           @body.eql?(other.body)
  end

  private
    def title=(title)
      @title = title
    end

    def body=(body)
      @body = body
    end

    def publish(at=Time.now)
      @published_at = at
    end
end
