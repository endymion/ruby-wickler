require 'wickler'

describe 'the wickler' do
  
  before do
    @wickler = Wickler.new
  end
  
  it 'should get data' do
    @wickler.data.should_not be_nil
  end

  it 'should return attributes' do
    @wickler.venue_name.should            == 'The H-Wood'
    @wickler.venue_state.should           == 'CA'
    @wickler.venue_zip.should             == '90028'
    @wickler.venue_country.should         == 'USA'
    @wickler.venue_time_zone.should       == 'America/Los_Angeles'
    @wickler.last_connect_utc.should      match /^20\d\d/
    @wickler.last_connect_string.should   match /20\d\d/
    @wickler.last_sale_time_utc.should    match /^20\d\d/
    @wickler.last_sale_time_string.should match /20\d\d/
    @wickler.last_sale_sales.should       match /\d+/
    @wickler.last_sale_text.should        match /^WINE/
    @wickler.last_sale_bottles.should     match /\d+/
    @wickler.last_sale_items.should       match /\d+/
  end

  it 'should return more than one clicker record' do
    @wickler.clickers.should have(3).items
  end

  it 'should return clicker records with attributes' do
    for clicker in @wickler.clickers.each do
      clicker.name.should        match /\w+/
      clicker.in.should          match /\d+/
      clicker.out.should         match /\d+/
      clicker.time_utc.should    match /^20\d\d/
      clicker.time_string.should match /\d\:\d\d\:\d\d/
      clicker.battery.should     match /\d+/
      clicker.name_1.should      match /\w+/
      clicker.name_2.should      match /\w+/
      clicker.name_3.should      match /\w+/
      clicker.count_1.should     match /\d+/
      clicker.count_2.should     match /\d+/
      clicker.count_3.should     match /\d+/
    end
  end

end