class About < ActiveRecord::Base
  validates_presence_of :body
  validates :body, length: { maximum: 1000 }
end
