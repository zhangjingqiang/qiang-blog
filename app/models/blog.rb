class Blog < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :clicks, :dependent => :destroy
  
  validates :title, presence: true, length: { maximum: 200 }
  validates :permalink, presence: true, length: { maximum: 200 }, uniqueness: true
  validates :body, presence: true, length: { maximum: 100000 }
  
  default_scope { order('created_at DESC') }
  
  scope :by_tag, lambda { |tag_name| joins(:tags).where("tags.name = ?", tag_name) unless tag_name.blank? }
  
  def to_param
    permalink.to_s
  end
  
  attr_accessor :tag_list

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tags_string)
    tags_string.split(',').each do |tag|
      tag = tag.strip
      self.tags << ::Tag.where(name: tag).first_or_create unless self.tags.collect(&:name).include?(tag)
    end
    self.tags
  end
end
