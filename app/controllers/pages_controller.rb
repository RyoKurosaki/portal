class PagesController < ApplicationController
  def index
    @notices = Notice.last(5)
  end
end
