class SearchController < ApplicationController

  def index
    @members = Member.find_by_state
  end
end
