require 'rspec'
require 'selenium-webdriver'



describe 'Performance Horizon Test Exercise' do



   before(:each) do
     Selenium::WebDriver::Chrome.driver_path = '/home/dotcom/code_mart/tutorials/ruby/projects/freelance/kenneth/ruby-test-repo'+'/PerformanceHorizon/drivers/linux/chromedriver'
     @driver = Selenium::WebDriver.for :chrome
     @driver.manage.timeouts.implicit_wait = 120
     @driver.manage.window.maximize
     @driver.navigate.to('http://demoqa.com/')
   end

   after(:each) do
     @driver.quit
   end

  it 'should validate various actions on demoqa' do




    @driver.find_element(:id => "ui-id-1").click

    @driver.find_element(:id => "ui-id-2").click



    tab_3_element = @driver.find_element(:id => "ui-id-3")
    tab_3_element.click
    tab_3_title = tab_3_element.text
    p tab_3_title

    @driver.find_element(:id => "ui-id-4").click


    tab_5_element = @driver.find_element(:id => "ui-id-5")
    tab_5_element.click
    tab_5_title =tab_5_element.text
    p tab_5_title



    # Part Two
    @driver.find_element(:id => "menu-item-66").click
    sleep(1)
    tab_element = @driver.find_element(:id => "menu-item-153")
    tab_element.click



    # Part Three

    # Select Registration Form
    @driver.find_element(:id => "menu-item-374").click


    @driver.find_element(:name => 'first_name').send_key(tab_3_title)

    @driver.find_element(:id => "name_3_lastname").send_key(tab_5_title)


    intial_marital_element = @driver.find_element(:id => 'pie_register')

    marital_status_elements = intial_marital_element.find_elements(:tag_name => "input")
    #Using an enhanced for loop
    marital_status_elements.each do |marital_status_element|
      if(marital_status_element.attribute("value").include? ("married"))
          marital_status_element.click
          break
      end
    end


    intial_marital_element = @driver.find_element(:id => 'pie_register')

    marital_status_elements = intial_marital_element.find_elements(:tag_name => "input")
    #Using an enhanced for loop
    marital_status_elements.each do |marital_status_element|
      if(marital_status_element.attribute("value").include? ("cricket"))
        marital_status_element.click
        break
      end
    end



    country_element  = @driver.find_element(:id => "dropdown_7")
    country = Selenium::WebDriver::Support::Select.new(country_element)
    country.select_by(:value, "Australia")

    sleep 5



    expect(1).to be(1)
  end


end