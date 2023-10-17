Rails.application.routes.draw do
  get "/healthcheck/live", to: proc { [200, {}, %w[OK]] }
  get "/healthcheck/ready", to: GovukHealthcheck.rack_response

  get "/sitemaps/:organisation_slug", to: "organisation#show", defaults: { format: "xml" }
end
