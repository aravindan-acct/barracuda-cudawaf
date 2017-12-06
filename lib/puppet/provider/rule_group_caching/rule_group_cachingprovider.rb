require_relative '../../../puppet_x/modules/service/service_api.rb'
require_relative '../../../puppet_x/modules/rule_group/rule_group_api.rb'
require_relative '../../../puppet_x/modules/rule_group/rule_group_caching_api.rb'
require_relative '../../../puppet_x/modules/login_info.rb'

require 'json'
require 'base64'
require 'uri'
require 'logger'
Puppet::Type.type(:rule_group_caching).provide(:rule_group_cachingprovider) do

  mk_resource_methods

# this method will get server/servername and return true or false
def exists?
  @property_hash[:ensure] == :present

  # getting waf authorization token
  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  Puppet.debug("WAF authorization token:  #{auth_header}")
  service_instance = SwaggerClient::ServiceApi.new
  rule_instance = SwaggerClient::RuleGroupApi.new
  rule_group_caching_instance = SwaggerClient::RuleGroupCachingApi.new
# call get service

  ruleName = @resource[:name]
  serviceName = @resource[:service_name]
  Puppet.debug("WAF server name in manifest:  #{ruleName}")
  Puppet.debug("WAF service name in manifest : #{serviceName}")
  # Check for the existance of the Service before calling the server api.
  serviceresponse = service_instance.services_web_application_name_get(auth_header,serviceName,{})
  service_parsed_response = JSON.parse(serviceresponse)
  service_status_code=service_parsed_response["status_code"]

  if serviceresponse.to_s.empty?
    fail("Not able to process the request. Please check the request parameters")
  end

# Checking if the service exists in the WAF system.

  if service_status_code === '200'
   # call get server
    data,status_code,headers= rule_group_caching_instance.services_web_application_name_content_rules_rule_group_name_caching_get(auth_header,serviceName,ruleName)
    Puppet.debug("status_code received from WAF api GET server:  #{status_code}")

    if status_code === 200
      true
    elsif status_code == 404
      false
    else
     fail("Not able to process the request. Pleae check your request parameters.")
    end
    # get server call ends
  elsif service_status_code === '404'
    fail("You can not create the rule group as the service associated is not available. ")
  else
    fail("Not able to process the request. Pleae check your request parameters.")
 end
# get service call ends

end


#this method get all servers from WAF system and builds the instances array
def self.instances()
 Puppet.debug("Calling getservices method")
 services = getservices()

 Puppet.debug("List of services .................. #{services}")
 instances=[]
 services.each do |service|

   svc = service
   Puppet.debug("Calling getInstances method of serverprovider: ")
   serviceName=svc
   Puppet.debug("Service Name : #{serviceName}")
   login_instance = Login.new
   auth_header = login_instance.get_auth_header
   rule_instance = SwaggerClient::RuleGroupApi.new

   # get all servers from WAF
   data,status_code,headers = rule_instance.services_web_application_name_content_rules_get(auth_header,serviceName,{})
   Puppet.debug("WAF Get all servers response:    #{data}")

   response = JSON.parse(data)
   Puppet.debug("parsed response object is #{response}")
   svrData =response["data"]
   serviceName = response["Service"]
   Puppet.debug("The DATA:::::: #{svrData}")
   if svrData
     svrData.each do |key,value|
       servname = value["name"]
       val = value
       instances <<  new(
         :ensure => :present,
         :name => val["name"],
         :service_name => response["Service"]
       )
     end
   end

  end # do end services
  return instances
end


#this method get all services from WAF system and builds the instances array
def self.getservices

  Puppet.debug("Calling getservices  method of serverprovider: ")
  service_instances = []

  login_instance = Login.new
  auth_header = login_instance.get_auth_header
  service_instance = SwaggerClient::ServiceApi.new

# get all services from WAF
  data,status_code,headers = service_instance.services_get(auth_header,{})
  Puppet.debug("WAF Get all services response:    #{data}")
  unless data == '{}'
    if status_code == 200
      response = JSON.parse(data)
      svcobj = response["object"]
      Puppet.debug("Object is  #{svcobj}")
      svcData = response["data"]
      Puppet.debug("Service  data - having servers:  #{svcData}")
      svcData.each do |key,value|
        service_instances.push(value["name"])
      end
   end # if end
 end  # unless end
 return service_instances

end




# this method compares the name attribute from instances and resources. If it matches then sets the provider
def self.prefetch(resources)

  Puppet.debug("Calling self.prefetch method of serverprovider: ")
  servers = instances
  resources.each do |name,service_name|
     if provider = servers.find { |server| server.name == name && server.service_name == service_name}
#     if provider = servers.find { |server| server.name == name}
     resources[name].provider=provider
     end
  end
 end

# this method does a put call to waf servers. This will be triggered with ensure is present and exists method return true.
def flush
  Puppet.debug("Calling  flush method of serverprovider: ")
  if @property_hash != {}
     login_instance = Login.new
     auth_header = login_instance.get_auth_header
     rule_group_caching_instance = SwaggerClient::RuleGroupCachingApi.new
     ruleName=@resource[:name]
     serviceName=@resource[:service_name]
     Puppet.debug("WAF server name in manifest: #{ruleName}")

     data,status_code,headers = rule_group_caching_instance.services_web_application_name_content_rules_rule_group_name_caching_put(auth_header,serviceName,ruleName,message(resource),{})

     if status_code == 200
        return data
     else
        Puppet.debug("There is some problem to process the request. status_code is #{status_code}")
        return
     end
  end
end

# this is a util method to build the JSON array to post the request to WAF
def message(object)

  Puppet.debug("Object.......... #{object}")
  parameters = object.to_hash
  Puppet.debug("Parameters.......... #{parameters}")
  ruleName=@resource[:name]

  parameters.delete(:provider)
  parameters.delete(:ensure)
  parameters.delete(:loglevel)
  parameters.delete(:name)
  parameters.delete(:service_name)
  parameters=convert_underscores(parameters)
  return parameters
end

 def convert_underscores(hash)
    # Here lies some evil magic.  We want to replace all _'s with -'s in the
    # key names of the hash we create from the object we've passed into message.
    #
    # We do this by passing in an object along with .each, giving us an empty
    # hash to then build up with the fixed names.
    hash.each_with_object({}) do |(k ,v), obj|
      key = k.to_s.gsub(/_/, '-').to_sym
      obj[key] = v
    end
end



# this method does a POST call to create a server in WAF.this method will be called if the ensure is present and exists method return false
def create
  Puppet.debug("Calling create method of rule group provider:")
end

# this method will call the delete api of a WAF service
def destroy
  Puppet.debug("Calling rule group provider destroy method: ")
end

end
