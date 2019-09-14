defmodule Ipfinder.Validation.Asnvalidation do
  @moduledoc """
  Documentation for Asn validation.
  """

  @moduledoc since: "1.0.0"

  @doc """
  Helper method for validating an argument if it is asn number

  ## Parameters
     * `asn` - The AS number you want details for

  """

  @doc since: "1.0.0"
  def validate(asn) do
    regex = ~r/^(as|AS)(\d+)$/

    if String.match?(asn, regex) == false do
      raise "Invalid asn number"
    end
  end
end
