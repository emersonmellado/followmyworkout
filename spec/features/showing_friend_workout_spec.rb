require "rails_helper"

RSpec.feature "Showing Friend Workout" do
  before do
    @john = User.create(first_name: "John", last_name: "Smith", email: "john@example.com", password: "password")
    @peter = User.create(first_name: "Peter", last_name: "Doe", email: "peter@example.com", password: "password")

    @e1 = @john.exercises.create(duration_in_min: 74, workout: "weight lifting routine", workout_date: Date.today)
    @e2 = @peter.exercises.create(duration_in_min: 55, workout: "Peter jiujitsu classes", workout_date: Date.today)
    login_as(@john)
    @following = Friendship.create(user: @john, friend: @peter)
  end

  scenario "shows friend's workout for last 7 days" do
    visit "/"

    click_link "My Workout"
    click_link @peter.full_name

    expect(page).to have_content(@peter.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end
