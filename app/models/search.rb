require 'wiktionary'

class Search
  def initialize

  end

  def get_single_service(service, query)
    case service
    when "wiktionary"
      Wiktionary.new(query).translate
    when "fake"
      ["fake immediate response"]
    end
  end

  def get_all_results(query)
    @response = Hash.new

    available_services().each do |service|
      @response[service] = get_single_service(service, query)
    end

    @response
  end

  def available_services
    ["wiktionary", "fake"]
  end
end
