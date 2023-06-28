# frozen_string_literal: true

require 'spec_helper'
require 'webmock/rspec'
require 'api_for_asana'

describe ApiForAsana do
  let(:base_url) { 'https://app.asana.com/api/1.0' }
  let(:api) { Class.new { extend ApiForAsana } }

  context 'When we try to access all section' do
    it 'should return status code 200' do
      stub_request(:get, "#{base_url}/projects/1204884610326667/sections")
        .with(headers: { 'Authorization' => "Bearer #{ENV['API_KEY']}" })
      res = api.get_section('1204884610326667', 5)
      expect(res.code).to eq('200')
    end
  end

  context 'When we try to access a task list' do
    it 'should return status code 200' do
      stub_request(:get, "#{base_url}/sections/45689/tasks")
        .with(headers: { 'Authorization' => "Bearer #{ENV['API_KEY']}" })
      res = api.get_tasks('45689', 5)
      expect(res.code).to eq('200')
    end
  end

  context 'When we try to update the section' do
    it 'should return status code 200' do
      stub_request(:put, "#{base_url}/sections/1204884610326671")
        .with(body: { name: 'Approved' }, headers: { 'Authorization' => "Bearer #{ENV['API_KEY']}" })
      res = api.update_section('1204884610326671', 'Approved')
      expect(res.code).to eq('200')
    end
  end

  context 'When we try to update the task' do
    it 'should return status code 200' do
      stub_request(:put, "#{base_url}/tasks/12048846103271")
        .with(body: { name: 'Draft Logo' }, headers: { 'Authorization' => "Bearer #{ENV['API_KEY']}" })
      res = api.update_task('12048846103271', 'Draft Logo')
      expect(res.code).to eq('200')
    end
  end

  context 'When we try to create new section' do
    it 'should return status code 201' do
      stub_request(:post, "#{base_url}/projects/1204884610326667/sections")
        .with(body: { name: 'Approved' }, headers: { 'Authorization' => "Bearer #{ENV['API_KEY']}" }).to_return(body: '', status: 201, headers: {})
      res = api.create_section('1204884610326667', 'Approved')
      expect(res.code).to eq('201')
    end
  end

  context 'When we try to delete section' do
    it 'should return status code 200' do
      stub_request(:delete, "#{base_url}/sections/12048846103271")
        .with(headers: { 'Authorization' => "Bearer #{ENV['API_KEY']}" })
      res = api.delete_section('12048846103271')
      expect(res.code).to eq('200')
    end
  end
end
