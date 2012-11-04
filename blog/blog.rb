class Blog
  attr_reader :posts

  def initialize
    @posts = []
  end

  def add_post(title, body)
    new_post = Post.new(title, body)
    @posts << new_post
  end

  def publish
    @posts.each do |post|
      post.publish if !post.published?
    end
  end

  def published_posts
    @posts.select do |post|
      post.published?
    end.sort_by(&:published_at).reverse
  end
end
