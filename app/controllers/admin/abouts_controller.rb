class Admin::AboutsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  def index
    @abouts = About.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @about = About.new
  end

  def edit
  end

  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html { redirect_to admin_abouts_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @about }
      else
        format.html { render action: 'new' }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to admin_abouts_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @about.destroy
    respond_to do |format|
      format.html { redirect_to admin_abouts_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_about
      @about ||= About.find(params[:id])
    end 

    def about_params
      params.require(:about).permit(:body)
    end
end
