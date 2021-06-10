class CooksController < ApplicationController
  def index
  end

  def new
    @cook = Cook.new
  end
end
