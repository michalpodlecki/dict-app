class SearchController < ApplicationController
  def index
    @results = []

    search_model = Search.new
    @services = search_model.available_services

    if params[:query]
      @results = search_model.get_all_results(params[:query])
    end

    respond_to do |format|
      format.html
      format.json  { render :json => @results }
    end
  end

  def single_service
    results = Search.new.get_single_service(params[:service], params[:query])
    render :partial => "search/services/" + params[:service], :locals => {:result => results}
  end

  def services
    @services = Search.new.available_services
    respond_to do |format|
      format.json  { render :json => @services }
    end
  end
end
