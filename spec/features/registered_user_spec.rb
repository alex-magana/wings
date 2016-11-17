require "rails_helper"

Capybara.default_max_wait_time = 30

RSpec.feature "RegisteredUserUsesTheApp", js: true do
  before do
    page.driver.browser.manage.window.maximize
  end

  let(:user_valid) { User.find(3) }

  let(:user_invalid) do
    create :user, email: "precious.thiel.mann@murazik.com",
                  password: "1234567890"
  end

  context "User logs in" do
    scenario "with valid credentials" do
      visit login_path
      fill_in "email", with: user_valid.email
      fill_in "password", with: user_valid.password
      find("div.input-field #submit").click
      sleep(0.3)
      expect(page).to have_content("Log Out", count: 1)
      sleep(0.3)
    end

    scenario "with invalid credentials" do
      visit login_path
      fill_in "email", with: user_invalid.email
      fill_in "password", with: user_invalid.password
      find("div.input-field #submit").click
      expect(page).to have_content("Invalid username or password.")
    end
  end
end
