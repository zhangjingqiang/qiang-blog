module BlogsHelper
  def blog_permalink(id)
    Blog.find_by(id: id).permalink
  end
  
  def blog_entity(id)
    Blog.find_by(id: id)
  end
end
