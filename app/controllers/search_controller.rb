require 'dict'

class SearchController < ApplicationController
  def search
    expires_in 14.day, :public => true, 'max-stale' => 0

    if params[:service]
      @services = [params[:service]]
    else
      @services = Dict.available_dictionaries
    end

    @query = params[:q] || ""

    respond_to do |format|
      format.html do
        response.headers["Cache-Control"] = "no-cache"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "#{1.year.ago}"
      end
      format.json  do
        begin
          @results = get_translations
          render :json => @results
        rescue Dict::Dictionary::ConnectError => e
          @exception_info = e.original.message
          render :json => ["Some error"]
        end
      end
      format.js do
        begin
          @results = get_translations
        rescue Dict::Dictionary::ConnectError => e
          @exception_info = e.original.message
          render :template => 'search/load_error'
        end
      end
    end
  end

  def run
    @query = params[:q] || ""
    respond_to do |format|
      format.js
    end
  end

  def services
    services = Dict.available_dictionaries
    respond_to do |format|
      format.json  { render :json => services }
    end
  end

  private
  def get_translations
    {}.tap do |results|
      @services.each do |service|
        results[service] = Dict.get_single_dictionary_translations(@query, service)
      end
    end
  end
end
