require "rails_helper"

RSpec.describe PurchaseMailer, type: :mailer do
  describe "purchase_created" do
    let(:mail) { PurchaseMailer.purchase_created }

    it "renders the headers" do
      expect(mail.subject).to eq("Purchase created")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
