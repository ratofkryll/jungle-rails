class OrderConfirmationMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_confirmation_email(order)
    @order = order
    @url = "http://jungle.com"
    mail(to: @order.email, subject: "Order ##{@order.id} Confirmation")
  end
end
