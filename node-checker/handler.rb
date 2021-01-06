# check for nodes unavailable and scale deployments
# assigned to those nodes to 0

require 'kubeclient'
require 'logging'

# Main entry point to the function
class Handler
  def run(body, _headers)
    status_code = 200 # Optional status code, defaults to 200
    response_headers = { 'content-type' => 'text/plain' }

    logging = Logging.logger(STDOUT)
    logging.info('#############################')
    logging.info 'Some logging from the installed logging gem'
    logging.info('#############################')

    auth_options = {
      bearer_token_file: '/var/openfaas/secrets/bearer-token'
    }

    client = Kubeclient::Client.new(
      'https://localhost:8443/api',
      'v1',
      auth_options: auth_options
    )
    logging.info auth_options.inspect
    body = "Hello world from the Ruby template #{Time.now}"

    [body, response_headers, status_code]
  end
end
