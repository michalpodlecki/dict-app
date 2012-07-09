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

end
