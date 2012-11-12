class BlogPresenter
  def initialize(blog)
    @blog = blog
  end

  def format_title
    "<h1>#{@blog.title}</h1>"
  end

  def format_posts_list
    posts_list_html = "<ul>"
    @blog.published_posts.each do |post|
      posts_list_html += "<li>#{post.title}</li>"
    end
    posts_list_html += "</ul>"
  end
end
