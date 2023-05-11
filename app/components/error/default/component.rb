class Error::Default::Component < ApplicationComponent
  def initialize(options: {})
    @message_errors = options[:message_errors]
  end
end