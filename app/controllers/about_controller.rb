class AboutController < ApplicationController
  def index
    @about = About.first
  end
end
