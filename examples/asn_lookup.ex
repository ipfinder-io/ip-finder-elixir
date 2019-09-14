defmodule AsnLookup do
	use Ipfinder
	
	def asn do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, asn} = Ipfinder.getAsn(conf,"AS1")
	end
end