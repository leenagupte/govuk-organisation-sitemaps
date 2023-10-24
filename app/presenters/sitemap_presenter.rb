require "nokogiri"

class SitemapPresenter
  attr_reader :content_items

  def initialize(content_items)
    @content_items = content_items
  end
  
  def sitemap_xml
    builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
      xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
        content_items.each do |content_item|
          xml.url do
            xml.loc external_url(content_item["link"])
            xml.lastmod content_item["public_timestamp"] if content_item["public_timestamp"]
          end
        end
      end
    end
    builder.to_xml
  end

private

  def external_url(link)
    URI.join(base_url, link).to_s
  end

  def base_url
    Plek.website_root
  end  
end
