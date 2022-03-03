class AuthenticateUser
    def initialize(company_email, password)
      @company_email = company_email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_reader :company_email, :password
  
    # verify user credentials
    def user
      user = User.find_by(company_email: company_email)
      return user if user && user.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
end
  