require 'wiktionary'
require 'exceptions'

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
    rescue
      raise Exceptions::RubyGemError
  end

  def get_results_for(services, query)
    {}.tap do |results|
      services.each do |service|
        results[service] = get_single_service(service, query)
      end
    end
  end

  def available_services
    %w(wiktionary fake)
  end
end
