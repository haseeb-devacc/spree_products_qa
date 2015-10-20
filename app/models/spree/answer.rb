class Spree::Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user, :class_name => Spree.user_class.to_s
  validates :content, presence: true

  after_create :send_email, if: ->() { SpreeProductsQa.send_email? }
  # after_update :send_email, if: ->() { SpreeProductsQa.send_email? }

  def send_email
    QaMailerWorker.perform_async(self.question.id) if self.question.present?
    # QaAnswerMailer.deliver_answer_email(self.question)
  end
end
