class MemberService < ApplicationController

  def find_by_house
    response = Faraday.get "https://api.propublica.org/congress/v1/members/house/CO/current.json"
    JSON.parse(response.body, symbolize_names: true)
  end
end
