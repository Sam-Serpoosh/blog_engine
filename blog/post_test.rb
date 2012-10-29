require_relative "../test/unit_test"
require_relative "../test/assertion"
require_relative "./post"
require "time"

class PostTest < UnitTest
  def initialize
    super(self)
  end

  def test_set_title_in_constructor
    title = "test title"
    post = Post.new(:title => title, 
                    :content => "sample content")
    Assertion.are_equal(title, post.title)
  end

  def test_set_content_in_constructor
    content = "sample content"
    post = Post.new(:title => "test title",
                    :content => content)
    Assertion.are_equal(content, post.content)
  end

  def test_publish_set_the_datetime_of_post_to_current
    published_at = StubTime.now
    post = Post.new(:title => "test title",
                    :content => "sample content")
    post.publish(StubTime)
    Assertion.are_equal(published_at, post.published_at)
  end
end

class StubTime
  def self.now
    time = "2012-10-28 21:00"
    Time.parse(time)
  end
end

PostTest.new.run
