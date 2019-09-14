defmodule TokenInfo do
	use Ipfinder
	def stats do
		conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")
		{:ok, status} = Ipfinder.getStatus(conf)
	end
end