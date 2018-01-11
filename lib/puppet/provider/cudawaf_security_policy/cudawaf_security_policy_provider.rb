require 'puppet_x/modules/login_info'
require 'puppet/provider/cudawaf'
require 'puppet/util/network_device'

require 'json'
require 'base64'
require 'uri'
require 'logger'

Puppet::Type.type(:cudawaf_security_policy).provide(:cudawaf_security_policy_provider, :parent => Puppet::Provider::Cudawaf) do
  attr_accessor :transport

  mk_resource_methods

  # this method will get security policy name and return true or false
  def exists?
    Puppet.debug("Calling exists method of cudawaf_security_policy_provider: ")
    @property_hash[:ensure] == :present
  end

  #this method get all security policies from WAF system and builds the instances array
  def self.instances
    Puppet.debug("Calling self.instances method of cudawaf_security_policy_provider: ")
    instances = []

    response, status_code, headers = Puppet::Provider::Cudawaf.get("SecurityPolicy", {})
    Puppet.debug("WAF Get all security policies response: #{response}")

    unless response == '{}'
      if status_code == 200
        policyData = response["data"]

        policyData.each do |key,value|
          val = value
          instances <<  new(
            :ensure => :present,
            :name => val["name"]
          )
        end
      end # if end
    end  # unless end
    
    return instances
  end

  # this method compares the name attribute from instances and resources. If it matches then sets the provider
  def self.prefetch(resources)
    Puppet.debug("Calling self.prefetch method of cudawaf_security_policy_provider: ")
    security_policies = instances
    resources.keys.each do |name|
      if provider = security_policies.find { |security_policy| security_policy.name == name}
        resources[name].provider=provider
      end
    end
  end

  # this method does a put call to waf security policy. This will be triggered with ensure is present and exists method return true.
  def flush
    Puppet.debug("Calling flush method of cudawaf_security_policy_provider: ")
    if @property_hash != {}
      response, status_code, headers = Puppet::Provider::Cudawaf.put("SecurityPolicy", @resource[:name], message(resource), {})
    end
    
    return response, status_code, headers
  end

  # this is a util method to build the JSON array to post the request to WAF
  def message(object)
    opts = object.to_hash
    opts.delete(:provider)
    opts.delete(:ensure)
    opts.delete(:loglevel)
    opts = convert_underscores(opts)
  
    return opts
  end

  def convert_underscores(hash)
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
  end


  # this method does a POST call to create a security policy in WAF.this method will be called if the ensure is present and exists method return false
  def create
    Puppet.debug("Calling create method of cudawaf_security_policy_provider:")

    response, status_code, headers = Puppet::Provider::Cudawaf.post("SecurityPolicy", message(resource), {})

    if status_code == 201
       @property_hash.clear
       return response, status_code, headers
    else
      fail("Not able to create the security policy. Please check the security policy api parameters")
    end
  end

  # this method will call the delete api of a WAF security policy
  def destroy
    Puppet.debug("Calling destroy method of cudawaf_security_policy_provider: ")

    response, status_code, headers = Puppet::Provider::Cudawaf.delete(device_url, "SecurityPolicy", @resource[:name], {})

    @property_hash.clear

    return response, status_code, headers
  end

end
