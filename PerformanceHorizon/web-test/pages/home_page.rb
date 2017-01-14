require_relative '../../web-test/pages/base_page'

class HomePage < BasePage

  def initialize(driver)
    super(driver)
  end


  def select_tab_one()
    @driver.find_element(:id => "ui-id-1").click

  end

  def select_tab_two()
    driver.find_element(:id => "ui-id-2").click
  end

  def select_tab_three()
    tab_3_element = driver.find_element(:id => "ui-id-3")
    tab_3_element.click
    return tab_3_element.text
  end

  def select_tab_four()
    driver.find_element(:id => "ui-id-4").click
  end

  def select_tab_five()
    tab_5_element = driver.find_element(:id => "ui-id-5")
    tab_5_element.click
    tab_5_title =tab_5_element.text
    return tab_5_title
  end

  def visit_tabPage
    return TabPage.new(driver)
  end

  def open_demo
    driver.find_element(:id => "menu-item-66").click
    sleep(1)
  end

end