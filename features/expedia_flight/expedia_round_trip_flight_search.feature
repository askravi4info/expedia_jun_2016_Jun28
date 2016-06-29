Feature: Expedia Round Trip Flight Search

  Background:
    Given user is on Expedia Home page
    And user select the round trip tab under the flight section

  @ravi
  Scenario: Verify the user gets the correct flight search results
    And user selects Columbus, OH airport for the city columbus from departure field
    And user selects Cleveland, OH airport for the city cleveland from arrival field
    And user makes a future date flight search
    And user searches for the flights availability
    Then verify the Select your departure to Cleveland message is displayed in the flight search page

  @smoke
  Scenario: Verify the user gets an error message when searching for Past date
    And user selects Columbus, OH airport for the city columbus from departure field
    And user selects Cleveland, OH airport for the city cleveland from arrival field
    And user makes a past date flight search
    And user searches for the flights availability
    Then verify the "Departing date is in the past. Please enter a valid departing date." error message is displayed

  @wip
  Scenario Outline: Verify the user gets the available flights for the future date
    And user selects <departure_airport> airport for the city <dep_city_name> from departure field
    And user selects <arrival_airport> airport for the city <arr_city_name> from arrival field
    And user makes a future date flight search
    And user searches for the flights availability
    Then verify the <message> message is displayed in the flight search page
  Examples:
    | dep_city_name | arr_city_name | departure_airport | arrival_airport | message                            |
    | columbus      | cleveland     | Columbus, OH      | Cleveland, OH   | Select your departure to Cleveland |
    | Los Angeles   | cleveland     | Los Angeles, CA   | Cleveland, OH   | Select your departure to Cleveland |

  @ravi
  Scenario:Verify different error messages when searching for past flights
    And user selects Columbus, OH airport for the city columbus from departure field
    And user selects Cleveland, OH airport for the city cleveland from arrival field
    And user makes a past date flight search
    And user searches for the flights availability
    Then verify the following error message are displayed
      | error_messages                                                      | dates |
      | Departing date is in the past. Please enter a valid departing date. | +2    |
      | Returning date is in the past. Please enter a valid returning date. | -2    |


  Scenario: Verify the flight search results are sorted by Price
    And user selects Columbus, OH airport for the city columbus from departure field
    And user selects Cleveland, OH airport for the city cleveland from arrival field
    And user makes a future date flight search
    And user searches for the flights availability
    Then verify the Select your departure to Cleveland message is displayed in the flight search page
    Then verify the flight search results are sorted by price

  Scenario: Verify the flight search results are sorted by Price by default
    And user searches for a valid future flight
    Then verify the flight search results are sorted by price


