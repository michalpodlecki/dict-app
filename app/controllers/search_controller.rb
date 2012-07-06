class SearchController < ApplicationController
  def index
    render_for_services(Search.new.available_services, params[:query])
  end

  def single_service
    render_for_services([params[:service]], params[:query])
  end

  def render_for_services(services, query)
    @results = {}
    search_model = Search.new

    @services = services

    respond_to do |format|
      format.html { render :action => "index" }
      format.json  do
        @results = search_model.get_results_for(services, query)
        render :json => @results
      end
      format.js do
        @results = search_model.get_results_for(services, query)
        render :action => "index"
      end
    end
  end

  def services
    @services = Search.new.available_services
    respond_to do |format|
      format.json  { render :json => @services }
    end
  end
end
