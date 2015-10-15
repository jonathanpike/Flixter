class StaticPagesController < ApplicationController
  def index
    @courses = Course.all
  end

  def team
  end

  def careers
  end

  def privacy
  end
end
