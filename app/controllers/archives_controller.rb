class ArchivesController < ApplicationController
  include BlogsHelper
  
  def index
    @year_month_blog_count = year_month_blog_count('all')
  end
end
