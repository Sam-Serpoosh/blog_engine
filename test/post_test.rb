require_relative "./unit_test"
require_relative "./assertion"
require_relative "../blog/post"

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

  def test_publishes_post_when_its_get_created
    post = Post.new(@title, @body)
    Assertion.are_not_equal(nil, post.published_at)
  end
end

PostTest.new.run
