module SessionsHelper

  def sign_in(user)
    # session[:remeber_token] = [user.id, user.salt]
    session[:user_id] = user.id 
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    
    # @current_user ||= User.find_by_id(session[:user_id])
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
  
  def signed_in?
    !current_user.nil?
    #  !self.current_user.nil? might work better but doesn't now.
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  def sign_out
    #  session[:remember_token] = nil
    session[:user_id] = nil
    self.current_user = nil
  end
  
  # def gottoken?
  #   !remember_token.nil?
  # end
  # 
  # def gotuserfromtoken?
  #   !user_from_remember_token.nil?
  # end
  
  
  
  
  private
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      # session[:remember_token] || [nil, nil] 
     
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
end
