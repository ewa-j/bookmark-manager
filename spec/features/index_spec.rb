# frozen_string_literal: true

feature 'index' do
  scenario 'expect page to show Hello World' do
    visit('/')
    expect(page).to have_content 'Hello World!'
  end
end
