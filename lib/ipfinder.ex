defmodule Ipfinder do
  use HTTPotion.Base
  alias Ipfinder.Validation.Asnvalidation
  alias Ipfinder.Validation.Domainvalidation
  alias Ipfinder.Validation.Firewallvalidation
  alias Ipfinder.Validation.Firewallvalidation
  alias Ipfinder.Validation.Ipvalidation
  # alias Ipfinder.Validation.Tokenvalidation

  @moduledoc """
  Documentation for Ipfinder.
  """

  @moduledoc since: "1.0.0"

  # DEFAULT BASE URL

  @default_base_url "https://api.ipfinder.io/v1/"

  def default_base_url, do: @default_base_url

  # The free token

  @default_api_token "free"

  def default_api_token, do: @default_api_token

  # DEFAULT FORMAT

  @format "json"

  def format, do: @format

  # service status path

  @status_path "info"

  def status_path, do: @status_path

  # IP Address Ranges path

  @ranges_path "ranges/"

  def ranges_path, do: @ranges_path

  # Firewall path

  @firewall_path "firewall/"

  def firewall_path, do: @firewall_path

  # Get Domain IP path

  @domain_path "domain/"

  def domain_path, do: @domain_path

  # Get Domain IP history path

  @domain_h_path "domainhistory/"

  def domain_h_path, do: @domain_h_path

  # Domain By ASN, Country,Ranges path

  @domain_by_path "domainby/"

  def domain_by_path, do: @domain_by_path

  defstruct token: nil,
            baseUrl: nil

  @doc """
  Constructor

  ## Parameters

    * `token` -  add your token
    * `baseUrl` - add proxy pass
  """
  def new(token \\ @default_api_token, baseUrl \\ @default_base_url) do
    # Tokenvalidation.validate(token)
    %Ipfinder{
      token: token,
      baseUrl: baseUrl
    }
  end

  @doc """
  call to server

  ## Parameters

    * `this`  - Ipfinder
    * `path`  - specific path of asn, IP address, ranges, Firewall,Token status
    * `format`- available format `json` `jsonp` `php` `xml`and Firewall format
  """
  def call(this, path, format \\ @format) do
    #  HTTPotion.post this.baseUrl, [body: "hello=" <> URI.encode("w o r l d !!"), headers: ["User-Agent": "My App", "Content-Type": "application/x-www-form-urlencoded"]]
    # body = '{\"token\": "this.token" , \"format\" : "{format}"}'
    body = %{"token" => this.token, "format" => format}
    header = ["User-Agent": "IPfinder elixir-client", "Content-Type": "application/json"]
    req = HTTPotion.post(this.baseUrl <> path, body: Jason.encode!(body), headers: header)

    if req.status_code != 200 do
      {:error, Jason.decode!(req.error, keys: :atoms)}
    else
      {:ok, Jason.decode!(req.body, keys: :atoms)}
    end
  end

  @doc """
  Get details for an Your IP address.




  ## Parameters

    * `this`  - Ipfinder

  ## Examples
  ```ex
  {:ok, auth} = Ipfinder.authentication(Ipfinder)

  ```

  """
  def authentication(this) do
    call(this, "")
  end

  @doc """
  Get details for an IP address.
  ## Parameters

    * `this`  - Ipfinder
    * `path`  - IP address.

    ## Examples
    
  ```ex
  {:ok, ip} = Ipfinder.getAddressInfo(Ipfinder,"1.0.0.0")

  ```
  """
  def getAddressInfo(this, path) do
    Ipvalidation.validate(path)
    call(this, path)
  end

  @doc """
  Get details for an AS number.
  ## Parameters

    * `this`  - Ipfinder
    * `path`  - AS number.
    
    ## Examples
    
  ```ex
  {:ok, asn} = Ipfinder.getAsn(Ipfinder,"as1")

  ```
  """
  def getAsn(this, path) do
    Asnvalidation.validate(path)
    call(this, path)
  end

  @doc """
  Get details for an API Token .

    ## Examples
    
  ```ex
  {:ok, status} = Ipfinder.getStatus(Ipfinder)

  ```
  """
  def getStatus(this) do
    call(this, @status_path)
  end

  @doc """
  Get details for an Organization name.
  ## Parameters

    * `this`  - Ipfinder
    * `path`  - Organization name.
    
    ## Examples
    
  ```ex
  {:ok, range} = Ipfinder.getRanges(Ipfinder,"Telecom Algeria")

  ```
  """
  def getRanges(this, path) do
    call(this, @ranges_path <> URI.encode(path))
  end

  @doc """
  Get Firewall data
  ## Parameters

    * `this`  - Ipfinder
    * `path`  - AS number, alpha-2 country only.
    * `formats`  - list formats supported
    
    ## Examples
    
  ```ex
  {:ok, range} = Ipfinder.getFirewall(Ipfinder,"DZ",'nginx_deny')

  ```
  """
  def getFirewall(this, path, formats) do
    Firewallvalidation.validate(path, formats)
    call(this, @firewall_path <> path, formats)
  end

  @doc """
  Get Domain IP
  ## Parameters

    * `this`  - Ipfinder
    * `path`  - The API supports passing in a single website name domain name

    ## Examples
    
  ```ex
  {:ok, range} = Ipfinder.getDomain(Ipfinder,"google.com")

  ```

  """
  def getDomain(this, path) do
    Domainvalidation.validate(path)
    call(this, @domain_path <> path)
  end

  @doc """
  Get Domain History IP
  ## Parameters

    * `this`  - Ipfinder
    * `path`  - The API supports passing in a single website name domain name

    ## Examples
    
  ```ex
  {:ok, range} = Ipfinder.getDomainHistory(Ipfinder,"google.com")

  ```

  """
  def getDomainHistory(this, path) do
    Domainvalidation.validate(path)
    call(this, @domain_h_path <> path)
  end

  @doc """
  Get list Domain By ASN, Country,Ranges
  ## Parameters

    * `this`  - Ipfinder
    * `by`  - The API supports passing in a single ASN,Country,Ranges
   
    ## Examples
    
  ```ex
  {:ok, range} = Ipfinder.getDomainHistory(Ipfinder,"DZ")

  ```

  """
  def getDomainBy(this, by) do
    call(this, @domain_by_path <> by)
  end
end
