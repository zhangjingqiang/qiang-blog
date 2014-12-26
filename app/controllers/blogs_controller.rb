class BlogsController < ApplicationController
  before_action :set_about_and_archive_and_tag
  
  def index
  end

  def show
    @blog ||= Blog.find_by(permalink: params[:id])
    
    @click = Click.where("created_at >= ? and blog_id = ? and ip = ?", Time.zone.now.beginning_of_day, @blog.id, request.remote_ip)
    if !@click.present?
      Click.create!({ blog_id: @blog.id, ip: request.remote_ip})
    end
  end
  
  def archive
    if !params[:year_month].nil?
      blogs = case ActiveRecord::Base.connection.adapter_name
      when 'SQLite'
        Blog.where("created_at like ?", params[:year_month] + "%")
      when 'MySQL'
        Blog.where("created_at like ?", params[:year_month] + "%")
      when 'PostgreSQL'
        year_month_arr = params[:year_month].split('-')
        Blog.where("date_part('year', created_at) = ? and date_part('month', created_at) = ?", year_month_arr[0], year_month_arr[1])
      else
        Blog.all
      end
      @blogs = blogs.paginate(:page => params[:page])
    end
  end
  
  def tag
    if !params[:tag_id].nil?
      @blogs = Blog.by_tag(params[:tag_id]).paginate(:page => params[:page])
    end
  end
  
  private
  
  def set_about_and_archive_and_tag
    @about = About.first
    @tags = Tag.all
    @blogs = Blog.paginate(:page => params[:page], :per_page => 10)
    
    @archives = Hash.new{|h, key| h[key] = []}
    @blogs.each do |blog|
      @archives[blog.created_at.strftime('%Y-%m')] << 1
    end
    @archives = Hash[@archives.map { |k, v| [k, v.reduce(:+)]}]
  end
end
