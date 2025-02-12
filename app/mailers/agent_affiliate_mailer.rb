class AgentAffiliateMailer < ApplicationMailer
  default from: 'info@andaraimperialterrace.co.id'

  def welcome_email(agent)
    @agent = agent
    mail(to: @agent.email, subject: 'Selamat Bergabung di Andara Agen Affiliate!')
  end
end
