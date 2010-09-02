require 'wickler'

describe 'the wickler' do
  
  before do
    @wickler = Wickler.new
  end
  
  it 'should get data' do
    @wickler.data.should_not be_nil
  end

  it 'should return attributes' do
    @wickler.venue_name.should_not be_nil
    @wickler.venue_state.should_not be_nil
    @wickler.venue_zip.should_not be_nil
    @wickler.venue_country.should_not be_nil
    @wickler.venue_time_zone.should_not be_nil
    @wickler.last_connect_utc.should_not be_nil
    @wickler.last_connect_string.should_not be_nil
    @wickler.last_sale_time_utc.should_not be_nil
    @wickler.last_sale_time_string.should_not be_nil
    @wickler.last_sale_sales.should_not be_nil
    @wickler.last_sale_text.should_not be_nil
    @wickler.last_sale_bottles.should_not be_nil
    @wickler.last_sale_items.should_not be_nil
  end

  it 'should return more than one clicker record' do
    @wickler.clickers.should have_at_least(2).items
  end

  it 'should return clicker records with attributes' do
    for clicker in @wickler.clickers.each do
      clicker.name.should_not be_nil
      clicker.in.should_not be_nil
      clicker.out.should_not be_nil
      clicker.time_utc.should_not be_nil
      clicker.time_string.should_not be_nil
      clicker.battery.should_not be_nil
      clicker.name_1.should_not be_nil
      clicker.name_2.should_not be_nil
      clicker.name_3.should_not be_nil
      clicker.count_1.should_not be_nil
      clicker.count_2.should_not be_nil
      clicker.count_3.should_not be_nil
    end
  end

end