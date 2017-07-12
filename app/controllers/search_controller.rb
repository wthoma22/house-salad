class SearchController < ApplicationController

  def index
    @members = Member.find_by_house(state: params[:search])
  end
end
