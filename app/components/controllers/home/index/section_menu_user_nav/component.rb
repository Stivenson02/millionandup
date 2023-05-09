class Controllers::Home::Index::SectionMenuUserNav::Component < ApplicationComponent
  def initialize(options: {})
    @user_ip = (options[:user_ip])
    @user_login = (options[:user_login])
    t_count = 0
    trolley = TrolleyService.new(type: :show_trolley, user_ip: @user_ip, user_login: @user_login).call
    trolley=trolley[:response][:data]

    unless trolley.nil?
      trolley.trolley_details.each { |a| t_count = t_count + a.amount } unless trolley.id.nil?
    end
    @trolley_detail_count = t_count
  end
end
