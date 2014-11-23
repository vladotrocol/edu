class Notifier < ActionMailer::Base
  default from: 'from@example.com'
  def raw_email( email, subject, body )
  mail(
    :to => email,
    :subject => subject
  ) do |format|
    format.html { render :text => body }
  end
end

end
