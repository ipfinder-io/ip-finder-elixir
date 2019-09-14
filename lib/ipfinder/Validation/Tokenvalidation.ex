defmodule Ipfinder.Validation.Tokenvalidation do
  @moduledoc """
  Documentation for Token validation.
  """
  @moduledoc since: "1.0.0"

  @doc """
   Helper method for validating IPFINDER TOKEN OR API KEY
   
   ## Parameters
     * `token` - Your API key or the string "free" for the free API
  """
  @doc since: "1.0.0"
  def validate(token) do
    if String.length(token) <= 25 do
      raise "Invalid IPFINDER API Token"
    end
  end
end
