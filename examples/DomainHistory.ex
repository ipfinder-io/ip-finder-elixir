defmodule DomainHistory do
	use Ipfinder
	def dom do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, domain} = getDomainHistory(conf,"google.fr")
	end
end