class NotifierController < ApplicationController
  def new
  	@recipient = User.find(params[:id])
  end
  def send_email
  	@recipient = User.find(params[:id]).email
  	# @email = dat_markdown(params[:content])
    ActionMailer::Base.mail(:from => current_user.email, 
    	:to => @recipient, :subject => params[:subject], 
    	content_type: "text/html", :body => 'params[:content]').deliver
  end
end
