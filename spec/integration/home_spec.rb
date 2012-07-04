require 'spec_helper'

describe "home page", :js => true do

  it "should have a header" do
    visit '/'
    page.should have_content('Dict')
  end

  it "shows some results after submiting a query" do
    visit '/some_query'
    
    page.has_xpath?("//div[@id='results_area']/*").should eq true
  end

  it "returns JSON when necessary" do
    get "/some_query", :format => :json
    response.should be_success

    lambda {JSON.parse(response.body)}.should_not raise_error
  end

end