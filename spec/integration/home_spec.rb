require 'spec_helper'

describe "home page", :js => true do

  it "should has any content" do
    visit '/'

    page.has_xpath?("//*").should eq true
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
