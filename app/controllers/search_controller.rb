class SearchController < ApplicationController
  def search
    if params[:service]
      @services = [params[:service]]
    else
      @services = Search.new.available_dictionaries
    end

    @query = params[:q] || ""
    search = Search.new

    respond_to do |format|
      format.html
      format.json  do
        begin
          @results = search.get_results_for(@services, @query)
          render :json => @results
        rescue Search::LoadError => e
          @exception_info = e.original.message
          render :json => ["Some error"]
        end
      end
      format.js do
        begin
          @results = search.get_results_for(@services, @query)
        rescue Search::LoadError => e
          @exception_info = e.original.message
          render :template => 'search/load_error'
        end
      end
    end
  end

  def services
    services = Search.new.available_dictionaries
    respond_to do |format|
      format.json  { render :json => services }
    end
  end
end
