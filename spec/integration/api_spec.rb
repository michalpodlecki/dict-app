require 'spec_helper'

describe "api" do

  before(:each) do
    Dict.stub(:get_single_dictionary_translations).and_return({})
  end

  it "returns JSON results for all results query" do
    Dict.stub(:available_dictionaries).and_return(%w{fake1 fake2})
    Dict.stub(:get_single_dictionary_translations).and_return("test response")

    get "/?q=some_query", :format => :json
    response.should be_success
    expected_response = {"fake1" => "test response", "fake2" => "test response"}

    JSON.parse(response.body).should eq expected_response
  end

  it "returns JSON results for single result query" do
    Dict.stub(:get_single_dictionary_translations).and_return("test response")

    get "/fake/?q=wiara", :format => :json
    response.should be_success
    expected_response = {"fake" => "test response" }

    JSON.parse(response.body).should eq expected_response
  end

  it "returns JSON of available services" do
    get "/services/list", :format => :json
    response.should be_success

    expected_value = Dict.available_dictionaries
    JSON.parse(response.body).should eq expected_value
  end
end
