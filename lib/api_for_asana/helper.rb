module Helper
  def send_http_request(req, uri)
    req['Authorization'] = "Bearer #{ENV['API_KEY']}"
     Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
  end
end