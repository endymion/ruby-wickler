require 'net/http'
require 'rubygems'
require 'xmlsimple'

require 'clicker'

class Wickler

  @@url = "http://www.thewickler.com/api/index.php?venuedriver=1"
    
  def initialize
    xml_data = Net::HTTP.get_response(URI.parse(@@url)).body
    @data = XmlSimple.xml_in(xml_data)
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