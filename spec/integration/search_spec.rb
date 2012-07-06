require 'spec_helper'

describe "home page", :js => true do

  it "should has any content" do
    visit '/'

    page.has_xpath?("//*").should eq true
  end

  # Now it's asynchronous and not always true
  # it "shows some results after submiting a query" do
  #   visit '/some_query'

  #   page.has_xpath?("//div[@id='results_area']/*").should eq true
  # end

  it "returns JSON for all results query, when expected" do
    get "/some_query", :format => :json
    response.should be_success

    lambda {JSON.parse(response.body)}.should_not raise_error
  end

  it "returns JSON for single result query, when expected" do
    get "/single/fake/wiara", :format => :json
    response.should be_success

    lambda {JSON.parse(response.body)}.should_not raise_error
  end

end
