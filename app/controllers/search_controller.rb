class SearchController < ApplicationController

  def index
    @members = Member.find_by_house
  end
end
