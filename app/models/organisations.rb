require "gds_api/content_store"
require "plek"

class Organisations

  def all
    all_organisations.map do |organisation|
      {
        title: organisation[:title],
        slug: organisation[:slug],
        acronym: organisation[:acronym],
      }
    end
  end

private

  def all_organisations
    organisations = []
    
    organisation_content_item[:details][:ordered_agencies_and_other_public_bodies].each do |organisation|
      organisations << organisation
    end

    organisation_content_item[:details][:ordered_devolved_administrations].each do |organisation|
      organisations << organisation
    end

    organisation_content_item[:details][:ordered_executive_offices].each do |organisation|
      organisations << organisation
    end

    organisation_content_item[:details][:ordered_high_profile_groups].each do |organisation|
      organisations << organisation
    end

    organisation_content_item[:details][:ordered_ministerial_departments].each do |organisation|
      organisations << organisation
    end

    organisation_content_item[:details][:ordered_non_ministerial_departments].each do |organisation|
      organisations << organisation
    end

    organisation_content_item[:details][:ordered_public_corporations].each do |organisation|
      organisations << organisation
    end

    organisations
  end

  def organisation_content_item
    response = GdsApi::ContentStore.new(content_store_url).content_item(base_path)
    response.to_h.deep_symbolize_keys
  end

  def base_path
    "/government/organisations"
  end

  def content_store_url
    Plek.find("content-store")
  end
end
