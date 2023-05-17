describe 'Friend' do
  before do
    visit '/'
  end

  subject(:create_friend) do
      click_link 'New friend'
      expect(page).to have_content("New friend")

      fill_in 'friend_name', with: 'Kasia'
      fill_in 'friend_surname', with: 'Kowalska'
      fill_in 'friend_email', with: 'kasiakowalska@gmail.com'
      fill_in 'friend_phone_number', with: '345678997'
      select 'work', from: 'friend_place_of_knowing'

      click_button 'Create Friend'
  end

  it "adds a new friend" do
    create_friend

    expect(page).to have_content('Kasia Kowalska')
    friend_email = page.find('#friend_email').value
    place_of_knowing = page.find('#friend_place_of_knowing').value
    expect(friend_email).to eq 'kasiakowalska@gmail.com'
    expect(place_of_knowing).to eq 'work'
    expect(page).to have_selector(:link_or_button, 'Back')

    click_link 'Back'
    expect(page).to have_content('Kasia')
    expect(page).to have_content('work')
    expect(page).to have_content('Friend was successfully created')
  end

  it "edit a friend" do
    create_friend
    click_link 'Back'
    expect(page).to have_content('Show this friend')
    click_link 'Show this friend'
    click_link 'Edit'
    expect(page).to have_content('Editing friend')
    fill_in 'friend_name', with: 'Ania'
    click_button 'Update Friend'
    expect(page).to have_content('Ania Kowalska')

    click_link 'Back'
    expect(page).to have_content('Friend was successfully updated.')
  end
end