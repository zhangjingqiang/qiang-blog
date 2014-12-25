class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  
  def index
    @blog_count = Blog.count
    @tag_count = Tag.count
    @click_count = Click.count
    @login_count = Login.count
    @blogs = Blog.limit(10)
    
    @login = Login.where("created_at >= ? and ip = ?", Time.zone.now.beginning_of_day, request.remote_ip)
    if !@login.present?
      Login.create!({ ip: request.remote_ip })
    end
  end
end
