require 'wiktionary'

class Search
  def initialize(query)
    @response = Hash.new
    @response["wiktionary"] = Wiktionary.new(query).translate
  end

  def get_results
    @response
  end
end
