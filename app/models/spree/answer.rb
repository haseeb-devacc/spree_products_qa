class Spree::Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user, :class_name => Spree.user_class.to_s

  after_create :send_email, if: ->() { SpreeProductsQa.send_email? }

  def send_email
    QaMailerWorker.perform_async(self.question.id) if self.question.present?
  end
end
