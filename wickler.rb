require 'net/http'
require 'rubygems'
require 'xmlsimple'

require 'rubygems'
require 'chronic'

require 'clicker'

class Wickler

  @@wickler_host_name = "www.thewickler.com"
    
  def initialize(
      username = ENV['WICKLER_USERNAME'],
      password = ENV['WICKLER_PASSWORD'],
      venue =    ENV['WICKLER_VENUE'],
      start_time = nil,
      end_time = nil
    )
    Net::HTTP.start(@@wickler_host_name) {|http|
          request = Net::HTTP::Get.new("/api/index.php?venuedriver=1&venue=#{venue}" +
            "&start=#{start_time}&end=#{end_time}")
          request.basic_auth username, password
          response = http.request(request)
          print response.body
          @data = XmlSimple.xml_in(response.body)
        }
  end
  
  attr_reader :data
  
  def clickers
    @data['clicker'].map {|clicker_data| Clicker.new clicker_data }
  end

  %w{
    venue_name
    venue_state
    venue_zip
    venue_country
    venue_time_zone
    last_connect_utc
    last_connect_string
    last_sale_time_utc
    last_sale_time_string
    last_sale_sales
    last_sale_text
    last_sale_bottles
    last_sale_items
  }.each do |attribute|
    define_method attribute do
      @data[attribute].first
    end
  end

end