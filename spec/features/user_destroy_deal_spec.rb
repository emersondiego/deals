require 'rails_helper'

feature 'User destroy a deal' do
  scenario 'successfully' do
    create(:deal)
    user = create(:user)
    login_as user

    visit root_path
    click_on 'Destroy'

    expect(page).to have_content('Your deal successfully destroyed!')
    expect(page).to have_content('Current Deals:')
    expect(page).not_to have_css('td', text: 'Founders Brewery')
    expect(page).not_to have_css('td', text: 'Multi Million Dollars Sale')
    expect(page).not_to have_css('td', text: 'Pending')
    expect(page).not_to have_css('td', text: 'US$ 7,5 M')
    expect(page).to have_content("Don't have deals yet")
  end
end
