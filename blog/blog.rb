class Blog
  attr_reader :posts

  def initialize
    @posts = []
  end

  def add_post(title, body)
    new_post = Post.new(title, body)
    @posts << new_post
  end

  def published_posts
    @posts.reverse
  end
end
