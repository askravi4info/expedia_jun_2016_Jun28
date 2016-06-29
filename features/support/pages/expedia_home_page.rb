class ExpediaHomePage
  include PageObject

  page_url 'www.expedia.com'

  link(:select_flight_tab, :id => 'tab-flight-tab')
  label(:select_round_trip_tab, :id => 'flight-type-roundtrip-label')
  text_field(:departure_airport, :id => 'flight-origin')
  text_field(:arrival_airport, :id => 'flight-destination')
  text_field(:dep_date, :id => 'flight-departing')
  text_field(:arr_date, :id => 'flight-returning')
  button(:search, :id => 'search-button')
  ul(:near_by_airports, :class => 'results')
  a(:date_before_current_date_msg, :class => 'dateBeforeCurrentDateMessage')
  div(:error_messages, :id => 'flight-errors')

  def set_dep_airport city_name, airport_code
    self.departure_airport = city_name
    self.departure_airport_element.send_keys :end
    self.departure_airport_element.send_keys :end
    select_airport airport_code
  end

  def set_arr_airport city_name, airport_code
    self.arrival_airport = city_name
    self.arrival_airport_element.send_keys :end
    self.arrival_airport_element.send_keys :end
    select_airport airport_code
  end

  def select_airport(airport_code)
    near_by_airports_element.when_present(30).list_item_elements.each do |airport_name|
      if airport_name.text.include? airport_code
        airport_name.click
        break
      end
    end
  end

  def set_travel_dates dep_date, arr_date
    self.dep_date = select_date dep_date
    self.arr_date = select_date arr_date
  end

  def select_date(days)
    (Time.now+60*60*24*days).strftime('%m/%d/%Y')
  end

  def testing_yml
    @file = YAML.load_file('C:\Documents and Settings\Administrator\Desktop\Automation\expedia_jun_2016\features\support\test_data.yml')
    # p @file.fetch('request')
    # p @file['content']['session']
    # p @file['content']['balance']
    #
    # File.open('../../test_data.yml', "w") {|f| f.write(@file.to_yaml) }
    #
    # @file['request'] = 33333
    # @file['content']['session'] = 2 #Modify
    #
    # p @file.fetch('request')
    # p @file['content']['session']

  end



end