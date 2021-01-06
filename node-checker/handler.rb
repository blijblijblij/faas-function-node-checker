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

    # TODO: do not verify ssl for now until ca.crt can be fed to
    # the function
    ssl_options = { verify_ssl: OpenSSL::SSL::VERIFY_NONE }

    client = Kubeclient::Client.new(
      'https://kubernetes.default.svc',
      'v1',
      auth_options: auth_options,
      ssl_options: ssl_options
    )
    logging.info client.inspect
    nodes = client.get_nodes
    nodes.each do |n|
      logging.info("Node:  #{n.inspect}")
    end
    body = "Hello world from the Ruby template #{Time.now}"

    [body, response_headers, status_code]
  end
end
