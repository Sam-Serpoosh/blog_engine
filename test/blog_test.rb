require_relative "./unit_test"
require_relative "./assertion"
require_relative "../blog/blog"
require_relative "../blog/post"

class BlogTest < UnitTest
  def initialize
    super(self)
  end

  def test_adding_new_post_to_blog
    blog = Blog.new
    blog.add_post("test title", "sample body")
    Assertion.are_equal(true, blog.posts[0].is_a?(Post))
    Assertion.are_equal(1, blog.posts.count)
  end

  def test_post_being_published_through_blog
    blog = Blog.new
    blog.add_post("test title", "sample body")
    blog.publish
    Assertion.are_equal(true, blog.posts[0].published?)
  end

  def test_blog_does_not_publish_post_that_is_already_published
    #TODO: find a way for testing this!
  end

  def test_get_only_published_posts
    blog = Blog.new
    title = "title1"
    blog.add_post(title, "body1")
    blog.publish
    blog.add_post("title2", "body2")
    published_posts = blog.published_posts
    Assertion.are_equal(1, published_posts.count)
    Assertion.are_equal(title, published_posts[0].title)
  end

  def test_get_published_posts_in_most_recent_first_order
    blog = Blog.new
    title1 = "title1"
    title2 = "title2"
    blog.add_post(title1, "body1")
    blog.add_post(title2, "body2")
    blog.publish
    published_posts = blog.published_posts
    Assertion.are_equal(title2, published_posts[0].title)
    Assertion.are_equal(title1, published_posts[1].title)
  end
end

BlogTest.new.run
