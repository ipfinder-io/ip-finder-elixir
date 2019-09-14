defmodule Ipfinder.Validation.Domainvalidation do
  @moduledoc """
  Documentation for Domainv alidation.
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
