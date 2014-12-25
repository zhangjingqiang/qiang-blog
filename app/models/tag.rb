class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :blogs, through: :taggings
  validates :name, presence: true
  
  default_scope { order('name') }
  
  def to_param
    name
  end
end
