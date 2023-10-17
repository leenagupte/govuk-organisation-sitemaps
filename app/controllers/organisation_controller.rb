class OrganisationController < ApplicationController
  def show
    content_items = Organisation.new(params[:organisation_slug]).find
    @xml_data = SitemapPresenter.new(content_items).sitemap_xml

    respond_to do |format|
      format.xml { render xml: @xml_data }
    end
  end
end
