defmodule Ipfinder.Validation.Domainvalidation do
  @moduledoc """

  #  IPFinder elixir Client Library

  The official elixir client library for the [IPFinder.io](https://ipfinder.io) get details for :
  -  IP address details (city, region, country, postal code, latitude and more ..)
  -  ASN details (Organization name, registry,domain,comany_type, and more .. )
  -  Firewall by supported formats details (apache_allow,  nginx_deny, CIDR , and more ..)
  -  IP Address Ranges by the Organization name  details (list_asn, list_prefixes , and more ..)
  -  service status details (queriesPerDay, queriesLeft, key_type, key_info)
  - Get Domain IP (asn, organization,country_code ....)
  - Get Domain IP history (total_ip, list_ip,organization,asn ....)
  - Get list Domain By ASN, Country,Ranges (select_by , total_domain  , list_domain ....)
  - [GitHub ipfinder elixir](https://github.com/ipfinder-io/ip-finder-elixir)
  - [ipfinder](https://ipfinder.io/)

  ## Documentation for Domainv alidation.
  """
  @moduledoc since: "1.0.0"

  @doc """
   Helper method for validating domain name

   ## Parameters
     * `domain` -  passing in a single website name domain name
     
  """
  @doc since: "1.0.0"
  def validate(domain) do
    regex = ~r/^(?!\-)(?:[a-zA-Z\d\-]{0,62}[a-zA-Z\d]\.){1,126}(?!\d+)[a-zA-Z\d]{1,63}$/

    if String.match?(domain, regex) == false do
      raise "Invalid Domain name"
    end
  end
end
