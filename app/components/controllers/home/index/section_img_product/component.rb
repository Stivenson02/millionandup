class Controllers::Home::Index::SectionImgProduct::Component < ApplicationComponent
  def initialize(options: {})
    @product = (options[:product])
    @carousel= @product.pictures.map{|p| p.id}
    @point= 0
  end
end
