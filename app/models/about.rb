class About < ActiveRecord::Base
  validates_presence_of :body
  validates :body, length: { maximum: 1000 }

  default_scope { order('created_at DESC') }
end
