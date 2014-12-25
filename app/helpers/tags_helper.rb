module TagsHelper
  def tag_name(tag_id)
    Tag.find_by_id(tag_id).name
  end
  
  def random_color
    %w(default primary success info warning danger).sample
  end
end
