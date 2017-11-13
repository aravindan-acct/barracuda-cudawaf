=begin
#Server API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 3.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require "uri"
require_relative "../swagger_client/api_client"
module SwaggerClient
  class ServerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # FETCH Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [nil]
    def services_web_application_name_servers_get(authorization, web_application_name, opts = {})
      services_web_application_name_servers_get_with_http_info(authorization, web_application_name, opts)
      return nil
    end

    # FETCH Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_get_with_http_info(authorization, web_application_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServerApi.services_web_application_name_servers_get ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServerApi.services_web_application_name_servers_get"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServerApi.services_web_application_name_servers_get"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)

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
        @api_client.config.logger.debug "API called: ServerApi#services_web_application_name_servers_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # ADD Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server Body Parameter of Server
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_servers_post(authorization, web_application_name, server, opts = {})
      services_web_application_name_servers_post_with_http_info(authorization, web_application_name, server, opts)
      return nil
    end

    # ADD Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server Body Parameter of Server
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_post_with_http_info(authorization, web_application_name, server, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServerApi.services_web_application_name_servers_post ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServerApi.services_web_application_name_servers_post"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServerApi.services_web_application_name_servers_post"
      end
      # verify the required parameter 'server' is set
      if @api_client.config.client_side_validation && server.nil?
        fail ArgumentError, "Missing the required parameter 'server' when calling ServerApi.services_web_application_name_servers_post"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers".sub('{' + 'Web Application Name' + '}', web_application_name.to_s)

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
      post_body = @api_client.object_to_http_body(server)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServerApi#services_web_application_name_servers_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # DELETE Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server_name Server Name of Server
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_servers_server_name_delete(authorization, web_application_name, server_name, opts = {})
      services_web_application_name_servers_server_name_delete_with_http_info(authorization, web_application_name, server_name, opts)
      return nil
    end

    # DELETE Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server_name Server Name of Server
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_server_name_delete_with_http_info(authorization, web_application_name, server_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServerApi.services_web_application_name_servers_server_name_delete ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServerApi.services_web_application_name_servers_server_name_delete"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServerApi.services_web_application_name_servers_server_name_delete"
      end
      # verify the required parameter 'server_name' is set
      if @api_client.config.client_side_validation && server_name.nil?
        fail ArgumentError, "Missing the required parameter 'server_name' when calling ServerApi.services_web_application_name_servers_server_name_delete"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers/{Server Name}".sub('{' + 'Web Application Name' + '}', web_application_name.to_s).sub('{' + 'Server Name' + '}', server_name.to_s)

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
        @api_client.config.logger.debug "API called: ServerApi#services_web_application_name_servers_server_name_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # FETCH Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server_name Server Name of Server
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [nil]
    def services_web_application_name_servers_server_name_get(authorization, web_application_name, server_name, opts = {})
      services_web_application_name_servers_server_name_get_with_http_info(authorization, web_application_name, server_name, opts)
      return nil
    end

    # FETCH Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server_name Server Name of Server
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_server_name_get_with_http_info(authorization, web_application_name, server_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServerApi.services_web_application_name_servers_server_name_get ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServerApi.services_web_application_name_servers_server_name_get"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServerApi.services_web_application_name_servers_server_name_get"
      end
      # verify the required parameter 'server_name' is set
      if @api_client.config.client_side_validation && server_name.nil?
        fail ArgumentError, "Missing the required parameter 'server_name' when calling ServerApi.services_web_application_name_servers_server_name_get"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers/{Server Name}  ".sub('{' + 'Web Application Name' + '}', web_application_name.to_s).sub('{' + 'Server Name' + '}', server_name.to_s)

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
        @api_client.config.logger.debug "API called: ServerApi#services_web_application_name_servers_server_name_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # EDIT Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server_name Server Name of Server
    # @param server Body Parameter of Server
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_servers_server_name_put(authorization, web_application_name, server_name, server, opts = {})
      services_web_application_name_servers_server_name_put_with_http_info(authorization, web_application_name, server_name, server, opts)
      return nil
    end

    # EDIT Information of Server
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of Server
    # @param server_name Server Name of Server
    # @param server Body Parameter of Server
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_server_name_put_with_http_info(authorization, web_application_name, server_name, server, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ServerApi.services_web_application_name_servers_server_name_put ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ServerApi.services_web_application_name_servers_server_name_put"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling ServerApi.services_web_application_name_servers_server_name_put"
      end
      # verify the required parameter 'server_name' is set
      if @api_client.config.client_side_validation && server_name.nil?
        fail ArgumentError, "Missing the required parameter 'server_name' when calling ServerApi.services_web_application_name_servers_server_name_put"
      end
      # verify the required parameter 'server' is set
      if @api_client.config.client_side_validation && server.nil?
        fail ArgumentError, "Missing the required parameter 'server' when calling ServerApi.services_web_application_name_servers_server_name_put"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers/{Server Name} ".sub('{' + 'Web Application Name' + '}', web_application_name.to_s).sub('{' + 'Server Name' + '}', server_name.to_s)

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
      post_body = @api_client.object_to_http_body(server)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServerApi#services_web_application_name_servers_server_name_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
