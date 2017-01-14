require_relative '../../drivers/custom_path'

class BrowserManager





  def set_up(machine)
    system_path = CustomPath.new().get_file_path
    if(machine.include?("windows"))
      Selenium::WebDriver::Chrome.driver_path = system_path+'/windows/chromedriver.exe'
    elsif(machine.include?("linux"))
      Selenium::WebDriver::Chrome.driver_path = system_path+'/linux/chromedriver'
    elsif(machine.include?("macosx"))
      Selenium::WebDriver::Chrome.driver_path = system_path+'/macosx/chromedriver'
    end
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.timeouts.implicit_wait = 120
    @driver.manage.window.maximize
    @driver.navigate.to('http://demoqa.com/')
    return @driver
  end

  def tear_down()
    @driver.quit
  end

end