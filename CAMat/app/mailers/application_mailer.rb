class ApplicationMailer < ActionMailer::Base
	default from: "noreply@camat.com"
	layout 'mailer'
end