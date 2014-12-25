class ArchivesController < ApplicationController
  def index
    @blogs = Blog.paginate(:page => params[:page])
  end
end
