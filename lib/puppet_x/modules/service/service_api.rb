=begin
#Service API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 3.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require "uri"
require_relative "../swagger_client/api_client"

module SwaggerClient
  class ServiceApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # FETCH Information of Service
    # 
    # @param authorization Login token
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [nil]
    def services_get(authorization, opts = {})
    data,status_code,headers = services_get_with_http_info(authorization, opts)
      return data,status_code,headers
    end

    # FETCH Information of Service
    # 
    # @param authorization Login token
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_get_with_http_info(authorization, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServiceApi.services_get ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServiceApi.services_get"
      end
      # resource path
      local_var_path = "/services"
      local_var_path= local_var_path + "?groups=Service"
      # query parameters
      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :multi) if !opts[:'fields'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceApi#services_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end

      return data, status_code, headers
    end

    # ADD Information of Service
    # 
    # @param authorization Login token
    # @param service Body Parameter of Service
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_post(authorization, service, opts = {})
     data,status_code,headers = services_post_with_http_info(authorization, service, opts)
      return data,status_code,headers
    end

    # ADD Information of Service
    # 
    # @param authorization Login token
    # @param service Body Parameter of Service
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_post_with_http_info(authorization, service, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServiceApi.services_post ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServiceApi.services_post"
      end
      # verify the required parameter 'service' is set
      if @api_client.config.client_side_validation && service.nil?
        fail ArgumentError, "Missing the required parameter 'service' when calling ServiceApi.services_post"
      end
      # resource path
      local_var_path = "/services"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(service)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceApi#services_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # DELETE Information of Service
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Service
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_delete(authorization, web_application_name, opts = {})
      services_web_application_name_delete_with_http_info(authorization, web_application_name, opts)
      return nil
    end

    # DELETE Information of Service
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Service
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_delete_with_http_info(authorization, web_application_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServiceApi.services_web_application_name_delete ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServiceApi.services_web_application_name_delete"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServiceApi.services_web_application_name_delete"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceApi#services_web_application_name_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # FETCH Information of Service
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Service
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [nil]
    def services_web_application_name_get(authorization, web_application_name, opts = {})
    resp= services_web_application_name_get_with_http_info(authorization, web_application_name, opts)
    return resp    
    end

    # FETCH Information of Service
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Service
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_get_with_http_info(authorization, web_application_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServiceApi.services_web_application_name_get ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServiceApi.services_web_application_name_get"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServiceApi.services_web_application_name_get"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)
      local_var_path = local_var_path + "?groups=Service"
      # query parameters
      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :multi) if !opts[:'fields'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceApi#services_web_application_name_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      #return data, status_code, headers
      response={"data"=>"#{data}",
                "status_code"=>"#{status_code}"
               }
      return JSON[response]
    end

    # EDIT Information of Service
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Service
    # @param service Body Parameter of Service
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_put(authorization, web_application_name, service, opts = {})
      services_web_application_name_put_with_http_info(authorization, web_application_name, service, opts)
      return nil
    end

    # EDIT Information of Service
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Service
    # @param service Body Parameter of Service
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_put_with_http_info(authorization, web_application_name, service, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServiceApi.services_web_application_name_put ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServiceApi.services_web_application_name_put"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServiceApi.services_web_application_name_put"
      end
      # verify the required parameter 'service' is set
      if @api_client.config.client_side_validation && service.nil?
        fail ArgumentError, "Missing the required parameter 'service' when calling ServiceApi.services_web_application_name_put"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(service)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceApi#services_web_application_name_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
