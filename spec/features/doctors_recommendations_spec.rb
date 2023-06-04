require 'rails_helper'

describe 'Doctor signs in and leaves a recommendation for the patient' do
  let(:user) { FactoryBot.create(:user, :doctor_user) }
  let(:appointment) { FactoryBot.create(:appointment) }

  it 'displays information about successful sign in and creating recommendation' do
    visit '/users/sign_in'
    fill_in 'Phone', with: user.phone
    fill_in 'Password', with: user.password
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."

    visit "/appointments/#{appointment.id}/doctors_recommendations/new"
    expect(page).to have_content "Write your recommendation"
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Save'
    expect(page).to have_content "Appointments"
  end
end