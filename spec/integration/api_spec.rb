require 'spec_helper'

describe "api" do

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

  it "returns JSON of available services" do
    get "/services/list", :format => :json
    response.should be_success

    expected_value = Dict.available_services
    JSON.parse(response.body).should eq expected_value
  end

  it "returns results from a single dictionary" do
    Search.any_instance.stub(:get_single_service).and_return("any results");
    Search.any_instance.should_receive(:get_single_service).with("fake", "smok").and_return("results for fake/smok")
    get "/single/fake/smok", :format => :json

    results = JSON.parse(response.body)
    results["fake"].should eq "results for fake/smok"
  end
end
