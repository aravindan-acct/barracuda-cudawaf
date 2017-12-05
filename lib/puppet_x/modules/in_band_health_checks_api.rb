=begin
#in band health checks API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 3.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require "uri"

module SwaggerClient
  class InBandHealthChecksApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # FETCH Information of in band health checks
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of in band health checks
    # @param web_server_name Web Server Name of in band health checks
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [nil]
    def services_web_application_name_servers_web_server_name_in_band_health_checks_get(authorization, web_application_name, web_server_name, opts = {})
       data,status_code,headers = services_web_application_name_servers_web_server_name_in_band_health_checks_get_with_http_info(authorization, web_application_name, web_server_name, opts)
      return data,status_code,headers
    end

    # FETCH Information of in band health checks
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of in band health checks
    # @param web_server_name Web Server Name of in band health checks
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_web_server_name_in_band_health_checks_get_with_http_info(authorization, web_application_name, web_server_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_get ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_get"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_get"
      end
      # verify the required parameter 'web_server_name' is set
      if @api_client.config.client_side_validation && web_server_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_server_name' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_get"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers/{Web Server Name}/in-band-health-checks".sub('{' + 'Web Application Name' + '}', web_application_name.to_s).sub('{' + 'Web Server Name' + '}', web_server_name.to_s)

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
        @api_client.config.logger.debug "API called: InBandHealthChecksApi#services_web_application_name_servers_web_server_name_in_band_health_checks_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # EDIT Information of in band health checks
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of in band health checks
    # @param web_server_name Web Server Name of in band health checks
    # @param in_band_health_checks Body Parameter of in band health checks
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def services_web_application_name_servers_web_server_name_in_band_health_checks_put(authorization, web_application_name, web_server_name, in_band_health_checks, opts = {})
      data,status_code,headers = services_web_application_name_servers_web_server_name_in_band_health_checks_put_with_http_info(authorization, web_application_name, web_server_name, in_band_health_checks, opts)
      return data,status_code,headers
    end

    # EDIT Information of in band health checks
    # 
    # @param authorization Login token
    # @param web_application_name Web Application Name of in band health checks
    # @param web_server_name Web Server Name of in band health checks
    # @param in_band_health_checks Body Parameter of in band health checks
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def services_web_application_name_servers_web_server_name_in_band_health_checks_put_with_http_info(authorization, web_application_name, web_server_name, in_band_health_checks, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_put ..."
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_put"
      end
      # verify the required parameter 'web_application_name' is set
      if @api_client.config.client_side_validation && web_application_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_application_name' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_put"
      end
      # verify the required parameter 'web_server_name' is set
      if @api_client.config.client_side_validation && web_server_name.nil?
        fail ArgumentError, "Missing the required parameter 'web_server_name' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_put"
      end
      # verify the required parameter 'in_band_health_checks' is set
      if @api_client.config.client_side_validation && in_band_health_checks.nil?
        fail ArgumentError, "Missing the required parameter 'in_band_health_checks' when calling InBandHealthChecksApi.services_web_application_name_servers_web_server_name_in_band_health_checks_put"
      end
      # resource path
      local_var_path = "/services/{Web Application Name}/servers/{Web Server Name}/in-band-health-checks".sub('{' + 'Web Application Name' + '}', web_application_name.to_s).sub('{' + 'Web Server Name' + '}', web_server_name.to_s)

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
      post_body = @api_client.object_to_http_body(in_band_health_checks)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InBandHealthChecksApi#services_web_application_name_servers_web_server_name_in_band_health_checks_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
