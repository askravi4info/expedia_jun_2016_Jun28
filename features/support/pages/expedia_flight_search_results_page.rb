class ExpediaFlightSearchResultsPage
  include PageObject

  span(:search_results_title, :class => 'title-city-text')
  div(:progress_bar, :class => 'progress-bar')
  spans(:price, :class => 'dollars price-emphasis')


  def wait_for_flights_results_to_display
    wait_until(60) {
      p progress_bar_element.div_element.element.attribute_value('style')
      progress_bar_element.div_element.element.attribute_value('style').include? 'width: 100%;'
    }
  end

  def get_price_details
    all_prices = []
    wait_for_flights_results_to_display
    price_elements.each do |price|
      all_prices << price.text[1..-1].gsub(',','').to_i
    end
    all_prices
  end


end