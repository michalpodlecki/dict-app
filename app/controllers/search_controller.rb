class SearchController < ApplicationController
  def index
    @results = {}
    @services = Search.new.available_services
  end

  def search
    if params[:service]
      @services = [params[:service]]
    else
      @services = Search.new.available_services
    end

    @results = {}
    @query = params[:query]
    search = Search.new

    respond_to do |format|
      format.html { render :action => "index" }
      format.json  do
        begin
          @results = search.get_results_for(@services, params[:query])
          render :json => @results
        rescue Search::LoadError => e
          @exception_info = e.original.message
          render :template => 'errors/loadError'
        end
      end
      format.js do
        begin
          @results = search.get_results_for(@services, params[:query])
          render :action => "index"
        rescue Search::LoadError => e
          @exception_info = e.original.message
        end
      end
    end
  end

  def services
    services = Search.new.available_services
    respond_to do |format|
      format.json  { render :json => services }
    end
  end
end
