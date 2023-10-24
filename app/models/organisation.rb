require "gds_api/search"
require "plek"

class Organisation
  attr_accessor :slug

  def initialize(slug)
    @slug = slug
  end

  def find
    response = GdsApi::Search.new(search_api_url).search_enum(
      { 
        fields: fields.join(","),
        filter_primary_publishing_organisation: slug,
      },
    )
  end

private

  def fields
    %w[
      link
      title
      primary_publishing_organisation
      public_timestamp
    ]
  end

  def search_api_url
    Plek.find("search-api")
  end
end
