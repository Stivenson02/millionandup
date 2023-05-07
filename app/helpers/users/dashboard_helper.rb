module Users::DashboardHelper
  def get_user_ip
    IPSocket.getaddress(Socket.gethostname)
  end
end
