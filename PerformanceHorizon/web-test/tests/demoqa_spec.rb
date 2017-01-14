require 'rspec'
require 'selenium-webdriver'
require_relative '../../web-test/browser/browser_manager'
require_relative '../../web-test/pages/base_page'
require_relative '../../web-test/pages/registration_page'
require_relative '../../web-test/pages/home_page'
require_relative '../../web-test/pages/tab_page'


describe 'Performance Horizon Test Exercise' do

  browserMgr = BrowserManager.new()

   before(:each) do
     @driver = browserMgr.set_up("linux")
   end

   after(:each) do
     browserMgr.tear_down
   end

  it 'should validate various actions on demoqa' do

    #Test Data
    country = "Australia"
    sports = "cricket"
    marital_status = "married"
    title_data = "Registration | Demoqa"


    #Actaul Test
    basePage = BasePage.new(@driver)
    homePage = HomePage.new(@driver)
    # Part One
    homePage.select_tab_one
    homePage.select_tab_two
    tab_3_title = homePage.select_tab_three
    homePage.select_tab_four
    tab_5_title = homePage.select_tab_five
    # Part Two
    tabPage = TabPage.new(@driver)
    homePage.open_demo
    tabPage.visit_tabs_page
    # Part Three
    # Select Registration Form
    tabPage.visit_registration_page
    registration = RegistrationPage.new(@driver)
    registration.enter_first_name(tab_3_title)
    registration.enter_last_name(tab_5_title)
    registration.select(marital_status)
    registration.select(sports)
    registration.select_country(country)


    #Validation of the Test
    expect(registration.fetch_current_page_title).to eq(title_data)
  end


end