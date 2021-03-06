require_relative '../../web-test/pages/base_page'
require_relative '../../web-test/pages/registration_page'

class TabPage < BasePage

  def initialize(driver)
    super(driver)
  end

  def open_tab
    tab_element = driver.find_element(:id => "menu-item-153")
    tab_element.click
  end

  def visit_registration_page
    driver.find_element(:id => "menu-item-374").click
    return RegistrationPage.new(driver)
  end


end