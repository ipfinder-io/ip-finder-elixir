defmodule RangesLookup do
	use Ipfinder
	def ran do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, range} = Ipfinder.getRanges(conf,"Telecom Algeria")
	end
end