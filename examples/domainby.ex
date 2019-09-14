defmodule Domainby do
	use Ipfinder
	def dom do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, by} = Ipfinder.getDomainBy(conf,"FR")
	end
end