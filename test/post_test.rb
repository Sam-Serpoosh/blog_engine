require_relative "./unit_test"
require_relative "./assertion"
require_relative "../blog/post"
require "time"

class PostTest < UnitTest
  def initialize
    super(self)

    @title = "test title"
    @body = "sample body"
  end

  def test_set_title_in_constructor
    post = Post.new(@title, @body)
    Assertion.are_equal(@title, post.title)
  end

  def test_set_body_in_constructor
    post = Post.new(@title, @body)
    Assertion.are_equal(@body, post.body)
  end

  def test_publish_set_the_datetime_of_post_to_current
    time = Time.parse("2012-10-28 21:00")
    post = Post.new(@title, @body)
    post.publish(time)
    Assertion.are_equal(time, post.published_at)
  end

  def test_post_knows_when_published
    post = Post.new(@title, @body)
    post.publish
    Assertion.are_equal(true, post.published?)
  end

  def test_post_knows_when_not_published
    post = Post.new(@title, @body)
    Assertion.are_equal(false, post.published?)
  end
end

PostTest.new.run
