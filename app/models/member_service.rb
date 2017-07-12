class MemberService < ApplicationController

  def initialize(house, state)
    @conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members")
    @house = house
    @state = state
  end

  def find_by_house
    response = conn.get "/#{house}/#{state}/current.json" do |request|
      request.headers['Authorization'] = x-api-key
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
