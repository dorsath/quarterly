Given /^I am looking at the project$/ do
  visit project_path(@project)
end

When /^I fill in the story name$/ do
  within "#add_story" do
    fill_in "story[name]", with: Faker::Lorem.sentence
  end
end

When /^I submit the story$/ do
  within "#add_story" do
    click_button t('story.add')
  end
end

Then /^the project should have a story$/ do
  Story.count.should == 1
  @project.stories.should include Story.last
end
