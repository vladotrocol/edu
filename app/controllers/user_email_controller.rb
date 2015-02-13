class UserEmailController < ApplicationController
  def new
  	@recipients = User.find(params[:user_ids])
  end
  def send_email
  	@recipients = User.find(params[:user_ids])
  	@recipients.each do |recipient|
  		Notifier.raw_email(recipient.email, params[:user_email][:subject], dat_markdown(params[:user_email][:body])).deliver
  	end
  	redirect_to(:controller => '/home', :action => 'admin_basic')
  end
end
