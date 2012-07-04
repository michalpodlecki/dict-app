class SearchController < ApplicationController
  def index
    @results = []
    
    if params[:query]
      @results = Search.new(params[:query]).get_results
    end

    respond_to do |format|
      format.html
      format.json  { render :json => @results }
    end
  end
end
