class Search
  def initialize(query)
    @query = query
  end

  def get_results
    ['Response: ' + @query]
  end
end