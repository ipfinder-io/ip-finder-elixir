defmodule GetDomain do
	use Ipfinder
	def do do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, domain} = Ipfinder.getDomain(conf,"google.fr")
	end
end