class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = ensure_hash(params[:variables])
    operation_name = params[:operationName]
    # Query context goes here, for example: { current_user: current_user }
    # context = {}
    result = UserManagementSchema.execute(params[:query],
                                          variables: variables,
                                          context: {},
                                          operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    return {} if ambiguous_param.nil? || ambiguous_param.blank?

    case ambiguous_param
    when String
      ensure_hash(JSON.parse(ambiguous_param))
    when Hash, ActionController::Parameters
      ambiguous_param
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: { errors: [{ message: err.message, backtrace: err.backtrace }],
                   data: {} }, status: 500
  end
end
