defmodule AuthenticationLookup do
	use Ipfinder
	def auth do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, auth} = Ipfinder.authentication(conf)
	end
end