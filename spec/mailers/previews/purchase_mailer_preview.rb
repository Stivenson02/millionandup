# Preview all emails at http://localhost:3000/rails/mailers/purchase_mailer
class PurchaseMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/purchase_mailer/purchase_created
  def purchase_created
    PurchaseMailer.purchase_created
  end

end
