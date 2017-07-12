class MemberService < ApplicationController

  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://api.propublica.org/congress/v1/members") do |faraday|
      faraday.headers["X-API-KEY: #{ENV['x-api-key']}"]
    @state = state
    end
  end

  def self.find_by_state
    response = @conn.get "/house/CO/current.json"
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

private
  attr_reader :conn, :filter

  def filter
    {
      limit: 7
    }
  end
end
