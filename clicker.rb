class Clicker

  def initialize(data)
    @data = data
  end
  
  %w{
    name
    in
    out
    time_utc
    time_string
    battery
    name_1
    name_2
    name_3
    count_1
    count_2
    count_3
  }.each do |attribute|
    define_method attribute do
      @data[attribute].first
    end
  end

end