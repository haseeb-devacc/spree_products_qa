class QaAnswerMailer < ActionMailer::Base
  def answer_email(question)
    @question = question
    @user = question.user
    mail(to: 'anam.dodhy@tkxel.com', subject: t('answer_email.subject'))
  end
end
