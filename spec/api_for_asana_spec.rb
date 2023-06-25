# frozen_string_literal: true



require 'spec_helper'

require 'api_for_asana'

describe 'ApiForAsana' do

  let(:dummy) { Dummy.new }



  context 'When we try to access all section' do

    it 'should return status code 200' do

      res = dummy.get_sections

      expect(res.code).to eq('200')

    end

  end



  context 'When we try to access a task list with wrong section id' do

    it 'should return status code 404' do

      res = dummy.get_tasks('45689')

      expect(res.code).to eq('404')

    end

  end

  context 'When we try to access a task list with correct section id' do

    it 'should return status code 200' do

      res = dummy.get_tasks('1204884610326670')

      expect(res.code).to eq('200')

    end

  end

  context 'When we try to update the section' do

    it 'should return status code 200' do

      res = dummy.update_section('1204884610326671', 'Completed')

      expect(res.code).to eq('200')

    end

  end

  context 'When we try to update the section with wrong id' do

    it 'should return status code 404' do

      res = dummy.update_section('12048846103271', 'Completed')

      expect(res.code).to eq('404')

    end

  end
  context 'When we try to update the task with wrong id' do
    it 'should return status code 404' do
      res = dummy.update_task('12048846103271', 'Draft Logo')
      expect(res.code).to eq('404')
    end
  end
  context 'When we try to update the task with valid task id' do
    it 'should return status code 200' do
      res = dummy.update_task('1204884611102860', 'Draft Logo')
      expect(res.code).to eq('200')
    end
  end

  context 'When we try to create new section' do

    it 'should return status code 201' do

      res = dummy.create_section('Approved')

      expect(res.code).to eq('201')

    end

  end

  context 'When we try to delete non empty section' do

    it 'should return status code 404' do

      res = dummy.delete_section('12048846103271')

      expect(res.code).to eq('404')

    end

  end

end



class Dummy

  include ApiForAsana

end

