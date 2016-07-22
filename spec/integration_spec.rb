require 'spec_helper'
require 'capybara/rspec'
require 'app'

Capybara.app = App

describe 'App', type: :feature do
  context 'visit /' do
    it 'returns a list of pipelines' do
      visit '/'

      expect(page).to have_css('li', count: 3)
    end
  end
end
