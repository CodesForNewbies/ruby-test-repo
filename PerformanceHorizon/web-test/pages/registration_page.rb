require_relative '../../web-test/pages/base_page'

class RegistrationPage < BasePage


  def initialize(driver)
    super(driver)
  end


  def enter_first_name(first_name)
    @driver.find_element(:name => 'first_name').send_key(first_name)
  end

  def enter_last_name(last_name)
    @driver.find_element(:id => "name_3_lastname").send_key(last_name)
  end

  def select(marital_status)
    intial_marital_element = @driver.find_element(:id => 'pie_register')

    marital_status_elements = intial_marital_element.find_elements(:tag_name => "input")
    #Using an enhanced for loop
    marital_status_elements.each do |marital_status_element|
      if(marital_status_element.attribute("value").include?(marital_status))
        marital_status_element.click
        break
      end
    end
  end


  def select_country(country)
    country_element  = @driver.find_element(:id => "dropdown_7")
    select_country = Selenium::WebDriver::Support::Select.new(country_element)
    select_country.select_by(:value, country)
  end

  def fetch_current_page_title
    return @driver.title
  end

end