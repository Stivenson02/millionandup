class PurchaseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_mailer.purchase_created.subject
  #
  def purchase_created
    @admin_email = params[:admin_email]
    @trolley_detail = params[:products]

    mail(
      from: "onetest@test.es",
      to: @admin_email,
      cc: Admin.all.pluck(:email),
      subject: "New Purchased Product"
    )
  end
end
