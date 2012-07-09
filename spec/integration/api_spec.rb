require 'spec_helper'

describe "api", :js => true do

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

end
