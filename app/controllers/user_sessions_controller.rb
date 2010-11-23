class UserSessionsController < ApplicationController

  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => :destroy

  def new
      @user_session = UserSession.new
  end

  def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
         flash[:notice] = "Sesión Iniciada"
        #redirect_back_or_default log_url
         redirect_to inicio_inicios_url
      else
         render :action => :new
      end
  end

  def destroy
      current_user_session.destroy
      flash[:notice] = "Sesión Cerrada"
      #redirect_back_or_default new_user_session_url
      redirect_to inicios_url
  end


   private
  def determine_layout
     if ['index'].include?(action_name)
        "application"
     else
        "basico"
     end
  end

end

