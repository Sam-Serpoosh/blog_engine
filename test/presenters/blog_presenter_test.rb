require_relative "../unit_test"
require_relative "../assertion"
require_relative "../../blog/post"
require_relative "../../blog/blog"
require_relative "../../presenters/blog_presenter"

class BlogPresenterTest < UnitTest
  def initialize
    super(self)
  end

  def test_there_is_bold_description_for_blog_posts_page
    title = "sample title"
    blog = Blog.new(title)
    blog_presenter = BlogPresenter.new(blog)
    formatted_title = blog_presenter.format_title
    Assertion.are_equal("<h1>#{title}</h1>", formatted_title)
  end

  def test_there_is_list_of_blog_posts_in_most_recent_first_order
    title1, title2 = "title1", "title2"
    blog = Blog.new("sample title")
    blog.add_post(title1, "body1")
    blog.add_post(title2, "body2")
    blog_presenter = BlogPresenter.new(blog)
    posts_list = blog_presenter.format_posts_list
    posts_list_html = "<ul><li>#{title2}</li><li>#{title1}</li></ul>"
    Assertion.are_equal(posts_list_html, posts_list)
  end
end

BlogPresenterTest.new.run
