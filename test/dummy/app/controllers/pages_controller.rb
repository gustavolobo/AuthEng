class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:show]
  
  def home
  end

  def show
  end
end
