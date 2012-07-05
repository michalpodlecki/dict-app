require 'wiktionary'

class Search
  def initialize

  end

  def get_single_service(service, query)
    case service
    when "wiktionary"
      Wiktionary.new(query).translate
    end
  end

  def get_all_results(query)
    @response = Hash.new
    @response["wiktionary"] = get_single_service("wiktionary", query)
    @response
  end

  def available_services
    ["wiktionary"]
  end
end
