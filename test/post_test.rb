require_relative "./unit_test"
require_relative "./assertion"
require_relative "../blog/post"
require "time"

class PostTest < UnitTest
  def initialize
    super(self)
  end

  def test_set_title_in_constructor
    title = "test title"
    post = Post.new(title, "sample body")
    Assertion.are_equal(title, post.title)
  end

  def test_set_body_in_constructor
    body = "sample body"
    post = Post.new("test title", body)
    Assertion.are_equal(body, post.body)
  end

  def test_publish_set_the_datetime_of_post_to_current
    time = Time.parse("2012-10-28 21:00")
    post = Post.new("test title", "sample body")
    post.publish(time)
    Assertion.are_equal(time, post.published_at)
  end
end

PostTest.new.run
