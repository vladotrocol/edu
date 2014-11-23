class UserEmailController < ApplicationController
  def new
  	@recipient = User.find(params[:id])
  end
  def send_email
  	@recipient = User.find(params[:id])
  	Notifier.raw_email(@recipient.email, params[:user_email][:subject], dat_markdown(params[:user_email][:body])).deliver
  	redirect_to(:controller => '/home', :action => 'index')
  end
end
