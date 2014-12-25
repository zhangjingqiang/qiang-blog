class Admin::SearchController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  
  def index
    @blogs = Blog.where("title like ? or body like ?", "%" + params[:q] + "%", "%" + params[:q] + "%").by_tag(params[:tag_id]).paginate(:page => params[:page])
  end
end
