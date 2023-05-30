if Rails.env.development?
  require "http_logger"
  HttpLogger.colorize = true # Default: true
  HttpLogger.log_headers = false # Default: false
  # HttpLogger.ignore = [/newrelic\.com/, /intercom\.io/]
  HttpLogger.ignore = [/newrelic\.com/]
end
