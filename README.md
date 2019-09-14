<img src='https://camo.githubusercontent.com/46886c3e689a0d4a3f6c0733d1cab5d9f9a3926d/68747470733a2f2f697066696e6465722e696f2f6173736574732f696d616765732f6c6f676f732f6c6f676f2e706e67' height='60' alt='IP Finder'></a>
#  IPFinder elixir Client Library

The official elixir client library for the [IPFinder.io](https://ipfinder.io) get details for :
-  IP address details (city, region, country, postal code, latitude and more ..)
-  ASN details (Organization name, registry,domain,comany_type, and more .. )
-  Firewall by supported formats details (apache_allow,  nginx_deny, CIDR , and more ..)
-  IP Address Ranges by the Organization name  details (list_asn, list_prefixes , and more ..)
-  service status details (queriesPerDay, queriesLeft, key_type, key_info)
- Get Domain IP (asn, organization,country_code ....)
- Get Domain IP history (total_ip, list_ip,organization,asn ....)
- Get list Domain By ASN, Country,Ranges (select_by , total_domain  , list_domain ....)

## Getting Started
singup for a free account at [https://ipfinder.io/auth/signup](https://ipfinder.io/auth/signup), for Free IPFinder API access token.

The free plan is limited to 4,000 requests a day, and doesn't include some of the data fields
To enable all the data fields and additional request volumes see [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

## Documentation

See the [official documentation](https://ipfinder.io/docs).

## Installation
Add IPFinder  to your project's dependencies in `mix.exs`:
```elixir
  defp deps do
    [
      {:ipfinder, "~> 1.0.1"}
    ]
  end

  def application do
    [ applications: [:ipfinder] ]
  end
```
And fetch your project's dependencies:

```bash
$ mix deps.get
```

## Usage
Note: You can load IPFinder into the Elixir REPL by executing this command from the root of your project:

```bash
$ iex -S mix
```

## With `free` TOKEN

```elixir
iex> conf = Ipfinder.new

# lookup your IP address information
iex> {:ok, auth} = Ipfinder.authentication(conf)

auth
# print your ip
auth.ip
```

## Authentication

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# lookup your IP address information
iex> {:ok, auth} = Ipfinder.authentication(conf)

iex> auth
# print your ip
iex> auth.ip

```

## Get IP address

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# GET Get details for 1.0.0.0
iex> {:ok, ip} = Ipfinder.getAddressInfo(conf,"1.0.0.0")
# print data
ip
```

## Get ASN
This API available as part of our Pro and enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

iex> {:ok, asn} = Ipfinder.getAsn(conf,"AS1")
# print data
iex> asn
```

## Firewall
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).
formats supported are :  `apache_allow`, `apache_deny`,`nginx_allow`,`nginx_deny`, `CIDR`, `linux_iptables`, `netmask`, `inverse_netmask`, `web_config_allow `, `web_config_deny`, `cisco_acl`, `peer_guardian_2`, `network_object`, `cisco_bit_bucket`, `juniper_junos`, `microtik`

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# lookup Asn Firewall information
iex> {:ok, fire} = Ipfinder.getFirewall(conf,"AS1", 'nginx_deny')

iex>fire
```

## Get IP Address Ranges
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# lookup Organization information
iex> {:ok, range} = Ipfinder.getRanges(conf,"Telecom Algeria")

iex> range
```

## Get service status

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# lookup IP TOKEN information
iex> {:ok, status} = Ipfinder.getStatus(conf)

iex> status
```

## Get Domain IP


```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

iex> {:ok, domain} = Ipfinder.getDomain(conf,"google.fr")

iex> domain
```

## Get Domain IP history

```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# domain name IP history
iex> {:ok, domain} = getDomainHistory(conf,"google.fr")

iex> domain
```

## Get list Domain By ASN, Country,Ranges


```elixir
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE")

# list live domain by country DZ,US,TN,FR,MA

iex> {:ok, by} = Ipfinder.getDomainBy(conf,"FR")

iex> by
```

## Add proxy
```r
iex> conf = Ipfinder.new("YOUR_TOKEN_GOES_HERE", "https://ipfinder.yourdomain.com")
```

Sample codes under **examples/** folder.


## Contact

Contact Us With Additional Questions About Our API, if you would like more information about our API that isn’t available in our IP geolocation API developer documentation, simply [contact](https://ipfinder.io/contact) us at any time and we’ll be able to help you find what you need.

## License
----

[![GitHub license](https://img.shields.io/github/license/ipfinder-io/ip-finder-elixir.svg)](https://github.com/ipfinder-io/ip-finder-elixir)