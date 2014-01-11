require 'capybara_helper'

feature "Create a booking email", type: :feature do
  scenario "edit booking email template" do
    sign_in :admin

    create_email_template
    page.should have_content "Booking email template was successfully updated."

    send_new_email "teacher@example.com"

    create_new_booking
    page.should have_content "Booking requested. We will be in touch."

    open_email "admin@example.com"

    current_email.should have_content 'Bikeability booking requested'
    current_email.should have_content 'Leeds Low'

    pending "Not implemented booking link correctly"
    current_email.find_link('a').click
    page.should have_content "Leeds Low"
    page.should have_content "17 children"
    page.should have_content "13 bikes"
  end

  def create_email_template
    visit "/booking_email_template/edit"

    fill_in "Body", with: <<-EMAIL.gsub(/^\s/, "")
      Dear <name>,

      <booking_link: Book here>

      Nice email
    EMAIL

    click_on "Save"
  end

  def send_new_email email
    school = School.create school_name: "Leeds Low", email: email, teacher_name: "John Barnaby-Gumbleton-Smythe"

    visit new_school_booking_email_path school

    page.should have_content <<-EMAIL.gsub(/^\s/, "")
      Dear John Barnaby-Gumbleton-Smythe,

      <booking_link: Book here>

      Nice email
    EMAIL


    clear_emails
    click_on "Send email"
  end

  def create_new_booking
    open_email "teacher@example.com"

    current_email.should have_content 'Nice email'
    current_email.find_link('a').click

    page.should have_content "John Barnaby-Gumbleton-Smythe"
    page.should have_content "Leeds Low"

    fill_in "Start date", with: "13/01/2015"
    fill_in "Number of children", with: 17
    fill_in "Required number of bikes", with: 13
    fill_in "Required number of helmets", with: 17

    click_on "Request booking"
  end
end
