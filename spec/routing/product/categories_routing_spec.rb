require "rails_helper"

RSpec.describe Product::CategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product/categories").to route_to("product/categories#index")
    end

    it "routes to #new" do
      expect(get: "/product/categories/new").to route_to("product/categories#new")
    end

    it "routes to #show" do
      expect(get: "/product/categories/1").to route_to("product/categories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/product/categories/1/edit").to route_to("product/categories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product/categories").to route_to("product/categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product/categories/1").to route_to("product/categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product/categories/1").to route_to("product/categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product/categories/1").to route_to("product/categories#destroy", id: "1")
    end
  end
end
