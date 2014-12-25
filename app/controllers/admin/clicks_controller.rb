class Admin::ClicksController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  
  def index
    @clicks = Click.paginate(:page => params[:page])
  end
end
