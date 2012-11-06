require_relative "./unit_test"
require_relative "./assertion"
require_relative "../blog/blog"
require_relative "../blog/post"

class BlogTest < UnitTest
  def initialize
    super(self)
  end

  def test_adding_new_post_to_blog
    post = Post.new("test title", "sample body")
    blog = Blog.new
    blog.add_post(post.title, post.body)
    Assertion.are_equal([post], blog.posts)
  end

  def test_get_published_posts_in_most_recent_first_order
    post1 = Post.new("title1", "body1")
    post2 = Post.new("title2", "body2")
    blog = Blog.new
    blog.add_post(post1.title, post1.body)
    blog.add_post(post2.title, post2.body)
    Assertion.array_equal([post2, post1], blog.published_posts)
  end
end

BlogTest.new.run
