defmodule FirewallLookup do
	use Ipfinder
	def fire do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, fire} = Ipfinder.getFirewall(conf,"AS1", 'nginx_deny')
	end
end