class MemberService < ApplicationController

  def initialize(state)
    @conn = Faraday.new(url: "https://api.propublica.org/congress/v1/members") do |faraday|
      faraday.headers["X-API-KEY: #{ENV["x-api-key"]}"]
    @state = state
  end

  def self.find_by_house
    response = @conn.get "/house/CO/current.json"
    binding.pry
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
