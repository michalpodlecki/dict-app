require 'spec_helper'

describe "home page", :js => true do

  it "should have content" do
    visit '/'
    page.should have_content('Dict')
  end

  it "shows some results after max. 5 seconds from submiting a query" do
    visit '/'
    fill_in 'query_field', :with => 'sample query'
    click_link 'Search'

    sleep 5 # not really a good idea, but can't think of anything better at a time
    page.has_xpath?("//div[@id='results_area']/*").should eq true
  end

end