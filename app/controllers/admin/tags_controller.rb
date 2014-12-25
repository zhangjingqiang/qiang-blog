class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to admin_tags_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to admin_tags_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to admin_tags_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tag
      @tag ||= Tag.find_by(name: params[:id])
    end 

    def tag_params
      params.require(:tag).permit(:name)
    end
end
