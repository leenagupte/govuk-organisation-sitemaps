require "gds_api/search"
require "plek"

class Organisation
  attr_accessor :slug

  def initialize(slug)
    @slug = slug
  end

  def find
    # TO DO: paginate through results
    response = GdsApi::Search.new(search_api_url).search(filter_organisations: [slug], start: 0, count: 1500)
    response.to_h.deep_symbolize_keys[:results]
  end

private

  def search_api_url
    Plek.find("search-api")
  end
end
