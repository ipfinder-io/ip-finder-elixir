defmodule IpfinderTest do
  use ExUnit.Case
  doctest Ipfinder

  test "test baseUrl" do
    conf = Ipfinder.new()
    assert conf.baseUrl == "https://api.ipfinder.io/v1/"
  end

  test "test free token" do
    conf = Ipfinder.new()
    assert conf.token == "free"
  end

  test "test token" do
    conf = Ipfinder.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    assert conf.token == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end

  test "test proxy" do
    conf =
      Ipfinder.new(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "https://ipfinder.yourdomain.com"
      )

    assert conf.baseUrl == "https://ipfinder.yourdomain.com"
  end

  test "test Get Status" do
    cons = "info"
    api = Ipfinder.status_path()
    assert cons == api
  end

  test "test Get Ranges" do
    cons = "ranges/"
    api = Ipfinder.ranges_path()
    assert cons == api
  end

  test "test Get Firewall" do
    cons = "firewall/"
    api = Ipfinder.firewall_path()
    assert cons == api
  end

  test "test Get Domain" do
    cons = "domain/"
    api = Ipfinder.domain_path()
    assert cons == api
  end

  test "test Get DomainHistory" do
    cons = "domainhistory/"
    api = Ipfinder.domain_h_path()
    assert cons == api
  end

  test "test Get DomainBy" do
    cons = "domainby/"
    api = Ipfinder.domain_by_path()
    assert cons == api
  end

  test "test Address getAddressInfo Exception" do
    assert_raise RuntimeError, "Invalid IPaddress", fn ->
      conf = Ipfinder.new()
      ip = "1..0.0.0"
      Ipfinder.getAddressInfo(conf, ip)
    end
  end

  test "test Asn getAsn Exception" do
    assert_raise RuntimeError, "Invalid asn number", fn ->
      conf = Ipfinder.new()
      asn = "ip"
      Ipfinder.getAsn(conf, asn)
    end
  end

  test "test Domain getDomainHistory and getDomain Exception" do
    assert_raise RuntimeError, "Invalid Domain name", fn ->
      conf = Ipfinder.new()
      domain = "fsdf"
      Ipfinder.getDomainHistory(conf, domain)
      Ipfinder.getDomain(conf, domain)
    end
  end

  test "test Firewall Format getFirewall Exception" do
    assert_raise RuntimeError,
                 "Invalid Format supported format https://ipfinder.io/docs/?shell#firewall",
                 fn ->
                   conf = Ipfinder.new()
                   format = "asdasd"
                   Ipfinder.getFirewall(conf, "as1", format)
                 end
  end

  test "test Firewall By getFirewall Exception" do
    assert_raise RuntimeError,
                 "Invalid Firewall string please use AS number or ISO 3166-1 alpha-2 country",
                 fn ->
                   conf = Ipfinder.new()
                   country = "DZZ"
                   Ipfinder.getFirewall(conf, country, "juniper_junos")
                 end
  end
end
