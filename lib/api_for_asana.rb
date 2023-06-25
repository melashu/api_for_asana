require 'net/http'
require 'dotenv'
require_relative './api_for_asana/helper'

module ApiForAsana
  include Helper
  Dotenv.load
  def get_section(project_id)
    uri = URI("#{base_url}/projects/#{project_id}/sections")
    req = Net::HTTP::Get.new(uri)
    send_http_request(req, uri)
  end

  def get_tasks(task_id)
    uri = URI("#{base_url}/sections/#{task_id}/tasks")
    req = Net::HTTP::Get.new(uri)
    send_http_request(req, uri)
  end

  def update_section(section_id, name)
    uri = URI("#{base_url}/sections/#{section_id}")
    req = Net::HTTP::Put.new(uri)
    req.set_form_data(name: name)
    send_http_request(req, uri)
  end

  def create_section(project_id, name)
    uri = URI("#{base_url}/projects/#{project_id}/sections")
    req = Net::HTTP::Post.new(uri)
    req.set_form_data(name: name)
    send_http_request(req, uri)
  end

  def delete_section(section_id)
    uri = URI("#{base_url}/sections/#{section_id}")
    req = Net::HTTP::Delete.new(uri)
    send_http_request(req, uri)
  end

  def update_task(task_id, name)
    uri = URI("#{base_url}/tasks/#{task_id}")
    req = Net::HTTP::Put.new(uri)
    req.set_form_data(name: name)
    send_http_request(req, uri)
  end

  private

  def base_url
    'https://app.asana.com/api/1.0'
  end
end
