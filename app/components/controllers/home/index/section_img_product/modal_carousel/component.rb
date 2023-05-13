class Controllers::Home::Index::SectionImgProduct::ModalCarousel::Component < ApplicationComponent
  def initialize(options: {})
    @picture = (options[:picture])
    @carousel= (options[:carousel])
    @point= (options[:point])
    @last= @carousel[(@point - 1)]
    @next= @carousel[(@point + 1)].nil? ? @carousel[0] : @carousel[(@point + 1)]
  end
end
