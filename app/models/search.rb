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

  def get_results_for(services, query)
    @response = Hash.new

    services.each do |service|
      @response[service] = get_single_service(service, query)
    end

    @response
  end

  def available_services
    ["wiktionary", "fake"]
  end
end
