class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.by_tag(params[:tag_id]).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blogs_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to admin_blogs_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog ||= Blog.find_by(permalink: params[:id])
    end 

    def blog_params
      params.require(:blog).permit(:title, :permalink, :body, :tag_list)
    end
end
