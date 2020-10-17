class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception # prevents method from being invoked by a route
    before_action :set_current_user, :authenticate!, :set_config
  
    def set_current_user
      # we exploit the fact that the below query may return nil
      @current_user ||= Moviegoer.where(:id => session[:user_id]).first
    end

    require 'themoviedb'
    Tmdb::Api.key("8ecb8b703e8c68d8dbe7134a356da5cc")

    def set_config
      @configuration = Tmdb::Configuration.new
    end

    protected
    def authenticate!
        unless @current_user
          redirect_to login_path
        end
    end

  end