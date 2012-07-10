require 'spec_helper'

describe Search do
  describe "#get_single_service" do
    it "should raise LoadError when Dict thrown exception" do
      search = Search.new
      Dict.stub(:get_single_dictionary_translations).and_raise()
      lambda { search.get_single_service("", "") }.should raise_exception(Search::LoadError)
    end
  end

  describe "#get_results_for" do
    it "returns results for each available service" do
      search = Search.new
      search.stub(:get_single_service).and_return("")

      services = %w{service1, service2}
      search.get_results_for(services, "sample_query").length.should eq services.length
    end
  end
end
