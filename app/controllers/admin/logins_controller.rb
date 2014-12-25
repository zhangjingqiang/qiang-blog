class Admin::LoginsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  
  def index
    @logins = Login.paginate(:page => params[:page])
  end
end
