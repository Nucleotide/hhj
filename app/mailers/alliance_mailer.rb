# coding: utf-8
class AllianceMailer < ActionMailer::Base
  default from: "admin@halloped.fi"
  
  def confirmation_email(membership, university, url)
    @call_title = membership.position_application.call.title
    @alliance = membership.alliance
    @university = university
    @url = url
    mail(:to => membership.position_application.user.email, :subject => "Kutsu vaaliliittoon. Inbjudan till valförbund. Invite to an electoral alliance.")
  end
end
