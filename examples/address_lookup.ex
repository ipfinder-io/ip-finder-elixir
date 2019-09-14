defmodule AddressLookup do
	use Ipfinder
	def add do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, ip} = Ipfinder.getAddressInfo(conf,"1.0.0.0")
	end
end