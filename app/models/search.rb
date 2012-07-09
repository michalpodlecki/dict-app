require 'exceptions'
require 'dict'

class Search
  def initialize
  end

  def get_single_service(service, query)
    Dict.get_single_dictionary_translations(query, service)
	rescue
      raise LoadError
  end

  def get_results_for(services, query)
    {}.tap do |results|
      services.each do |service|
        results[service] = get_single_service(service, query)
      end
    end
  end

  def available_services
    Dict.available_services
  end

  class LoadError < Exception
    attr_reader :original
    def initialize(original = $!)
      @original = original
    end
  end
end
