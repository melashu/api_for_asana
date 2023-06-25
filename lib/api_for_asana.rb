require 'net/http'
module ApiForAsana
    
  def get_sections
    req = Net::HTTP::Get.new(project_url)
    req['Authorization'] = token
    Net::HTTP.start(project_url.hostname, project_url.port, use_ssl: true) do |http|
      http.request(req)
    end
  end

  def get_tasks(id)
    uri = URI("https://app.asana.com/api/1.0/sections/#{id}/tasks")
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = token
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
  end

  def update_section(id, name)
    uri = section_url(id)
    req = Net::HTTP::Put.new(uri)
    req['Authorization'] = token
    req.set_form_data(name: name)
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
  end

  def create_section(name)
    req = Net::HTTP::Post.new(project_url)
    req['Authorization'] = token
    req.set_form_data(name: name)
    Net::HTTP.start(project_url.hostname, project_url.port, use_ssl: true) do |http|
      http.request(req)
    end
  end

  def delete_section(id)
    uri = section_url(id)
    req = Net::HTTP::Delete.new(uri)
    req['Authorization'] = token
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
  end

  def update_task(id, name)
    uri = URI("https://app.asana.com/api/1.0/tasks/#{id}")
    req = Net::HTTP::Put.new(uri)
    req['Authorization'] = token
    req.set_form_data(name: name)
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
  end

  private

  def project_url
    URI('https://app.asana.com/api/1.0/projects/1204884610326667/sections')
  end

  def token
    'Bearer 1/1204884589111623:bcd5f3b78ab8580dab44dda843374ad5'
  end

  def section_url(id)
    URI("https://app.asana.com/api/1.0/sections/#{id}")
  end
end
