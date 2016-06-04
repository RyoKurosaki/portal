class PagesController < ApplicationController
  def index
    @notices = Notice.last(5)
    @ads = Ad.all
  end
end
