class Click < ActiveRecord::Base
  belongs_to :blog

  default_scope { order('created_at DESC') }
end
