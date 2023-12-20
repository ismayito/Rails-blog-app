require 'rails_helper'

RSpec.describe 'User index page', type: :system do
require 'webdrivers'

puts Webdrivers::Chromedriver.driver_path
   let!(:users) do 
    User.create(
    [
    { Name: 'John Doe', Photo: 'https://example.com/john.jpg', PostsCounter:0 },
    { Name: 'John Smith', Photo: 'https://example.com/john.jpg', PostsCounter:0 },
    { Name: 'John Crege', Photo: 'https://example.com/john.jpg', PostsCounter:0 },
    ]
    )
   end

   it 'should show all users information' do
    visit users_path # this checks if the correct page exists
    users.each do |user| 
      expect(page).to have_css('.user-container')
      expect(page).to have_css('.user-image')
      expect(page).to have_css('.user-name')
      expect(page).to have_css('.post-counter')
      expect(page).to have_css('.user-link')
      expect(page).to have_content("Name: #{user.Name}")
      expect(page).to have_content("Number of posts: #{user.PostsCounter}")
      expect(page).to have_css("img[src*='#{user.Photo}']")
    end 
   end
    
   it "Should redirect to the selected user`s show page" do
    visit users_path # this checks if the correct page exists
    click_link users.first.Name

    expect(page).to have_current_path(user_path(users.first))
   end
end