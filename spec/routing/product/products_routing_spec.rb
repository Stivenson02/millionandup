require "rails_helper"

RSpec.describe Product::ProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product/products").to route_to("product/products#index")
    end

    it "routes to #new" do
      expect(get: "/product/products/new").to route_to("product/products#new")
    end

    it "routes to #show" do
      expect(get: "/product/products/1").to route_to("product/products#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/product/products/1/edit").to route_to("product/products#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product/products").to route_to("product/products#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product/products/1").to route_to("product/products#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product/products/1").to route_to("product/products#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product/products/1").to route_to("product/products#destroy", id: "1")
    end
  end
end
