class Member
  attr_reader :name, :role, :party, :districe
  def initialize(attrs)
    @attrs = attrs
    @name = attrs[:station_name]
    @fuel_type = attrs[:role]
    @access_times = attrs[:party]
    @distance = attrs[:district]
  end

  def address
    "#{attrs[:street_address]} #{attrs[:city]}, #{attrs[:state]} #{attrs[:zip]}"
  end

  def self.find_nearest(filter)
    NrelService.find_nearest(filter).map do |raw_station|
      new(raw_station)
    end
  end

private
  attr_reader :attrs
end
