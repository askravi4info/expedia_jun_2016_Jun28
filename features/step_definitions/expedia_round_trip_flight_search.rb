Given(/^user is on Expedia Home page$/) do
  visit ExpediaHomePage
end

And(/^user select the round trip tab under the flight section$/) do
  on(ExpediaHomePage).select_flight_tab
  on(ExpediaHomePage).select_round_trip_tab_element.click
end

And(/^user selects ([^"]*) airport for the city ([^"]*) from departure field$/) do |airport_name, city_name|
  on(ExpediaHomePage).set_dep_airport city_name, airport_name
end

And(/^user selects ([^"]*) airport for the city ([^"]*) from arrival field$/) do |airport_name, city_name|
  on(ExpediaHomePage).set_arr_airport city_name, airport_name
end

And(/^user searches for the flights availability$/) do
  on(ExpediaHomePage).search_element.click
end

Then(/^verify the ([^"]*) message is displayed in the flight search page$/) do |title_message|
  actual_title_message = on(ExpediaFlightSearchResultsPage).search_results_title

  # if actual_title_message == title_message
  #   p 'good'
  # else
  #   fail "Expected Message - #{title_message} is NOT same as Actual Message - #{actual_title_message}"
  # end

  fail "Expected Message - #{title_message} is NOT same as Actual Message - #{actual_title_message}" unless actual_title_message == title_message
  # expect(actual_title_message).should eq title_message
end

Then(/^verify the "([^"]*)" error message is displayed$/) do |exp_error_msg|
  actual_error_msg = on(ExpediaHomePage).date_before_current_date_msg_element.text

  fail "Expected Message - #{exp_error_msg} is NOT same as Actual Message - #{actual_error_msg}" unless exp_error_msg == actual_error_msg
  # expect(exp_error_msg).should eq actual_error_msg

end


And(/^user makes a (past|future) date flight search$/) do |past_future|
  if past_future == 'future'
    on(ExpediaHomePage).set_travel_dates 2, 2
  else
    on(ExpediaHomePage).set_travel_dates -2, -2
  end
end

Then(/^verify the following error message are displayed$/) do |table|
  table.hashes.each do |message|
    # p message['error_messages']
    # p message['dates']

    expected_error_msg = message['error_messages']
    actual_error_msg = on(ExpediaHomePage).error_messages

    on(ExpediaHomePage).verify_error_messages message['error_messages']
    fail "Actual Error Message - #{actual_error_msg} is NOT Same as Expected Error Message - #{expected_error_msg}" unless actual_error_msg.include? expected_error_msg

  end
end

Then(/^verify the flight search results are sorted by price$/) do
  actual_prices = on(ExpediaFlightSearchResultsPage).get_price_details
  sorted_prices = actual_prices.sort.sort

  fail "Actual Prices - #{actual_prices} is Not displayed in Ascending Order - #{sorted_prices} " unless actual_prices == sorted_prices
  # expect(actual_prices).should eq sorted_prices

end

And(/^user searches for a valid future flight$/) do

  #
  # step 'user searches for the flights availability'
  # step 'user searches for the flights availability'
  # step "user selects #{Columbus} airport for the city #{columbus} from departure field"
  # step "user makes a past date flight search"
  #
  #
  # steps %Q{
  #   Given the user #{name} exists
  #   Given I log in as #{name}
  #       }

  on(ExpediaHomePage) do |page|
    @file = page.testing_yml

    page.set_dep_airport @file['dep_city_name'], @file['dep_airport_name']
    # page.set_dep_airport 'columbus', 'Columbus, OH'
    # page.set_arr_airport 'cleveland', 'Cleveland, OH'
    # page.set_travel_dates 2, 2
    # page.search_element.click
  end

  actual_title_message = on(ExpediaFlightSearchResultsPage).search_results_title
  title_message = 'Select your departure to Cleveland'
  fail "Expected Message - #{title_message} is NOT same as Actual Message - #{actual_title_message}" unless actual_title_message == title_message


end

Given(/^I am using the yml file for testing$/) do
  on(ExpediaHomePage).testing_yml
end