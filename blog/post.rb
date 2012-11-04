class Post
  attr_reader :title, :body, :published_at

  def initialize(title, body)
    @title = title
    @body = body
  end

  def publish(at=Time.now)
    @published_at = at
  end

  def published?
    !@published_at.nil?
  end

  private
    def title=(title)
      @title = title
    end

    def body=(body)
      @body = body
    end
end
