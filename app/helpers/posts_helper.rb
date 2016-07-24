module PostsHelper
  def url
    request.protocol + request.host_with_port
  end
end
