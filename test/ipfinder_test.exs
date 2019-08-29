defmodule IpfinderTest do
  use ExUnit.Case
  doctest Ipfinder

  test "test baseUrl" do
  	conf = Ipfinder.new
    assert conf.baseUrl == "https://api.ipfinder.io/v1/"
  end

  test "test free token" do
  	conf = Ipfinder.new
    assert conf.token == "free"
  end

  test "test token" do
  	conf = Ipfinder.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    assert conf.token == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end

  test "test proxy" do
  	conf = Ipfinder.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","https://ipfinder.yourdomain.com")
    assert conf.baseUrl == "https://ipfinder.yourdomain.com"
  end

end
