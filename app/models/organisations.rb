require "gds_api/organisations"
require "plek"

class Organisations

  def all
    organisations.map do |organisation|
      {
        title: organisation["title"],
        slug: organisation["details"]["slug"],
        acronym: organisation["details"]["abbreviation"],
      }
    end
  end

private

  def organisations
    GdsApi::Organisations.new(Plek.website_root).organisations.with_subsequent_pages
  end
end
