class SearchController < ApplicationController

  def index
    @members = Member.find_by_house(state: params[:search])
  end
end

# Postman
# https://api.propublica.org/congress/v1/members/house/CO/current.json
# x-api-key fs7GLfE4863GiTsnS3qkw94uScKbrlmZ8GrNYbrJ
