require 'spec_helper'

describe Search do
  context "Search#get_single_service" do
    it "should raise LoadError when Dict thrown exception" do
      search = Search.new
      Dict.stub(:get_single_dictionary_translations).and_raise()
      lambda { search.get_single_service("", "") }.should raise_exception(Search::LoadError)
    end
  end
end
