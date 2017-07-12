class MemberService < ApplicationController

  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers = {"X-API-Key" => "#{ENV['x-api-key']}"}
    end
  end

  def find_by_state
    response = conn.get "/congress/v1/members/house/CO/current.json"
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
