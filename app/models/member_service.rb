class MemberService < ApplicationController

  def initialize(state)
    @conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members")
    @state = state
  end

  def self.find_by_house
    response = @conn.get "/house/CO/current.json" do |request|
      request.headers['Authorization'] = x-api-key
      binding.pry
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
