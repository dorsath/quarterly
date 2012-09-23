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

Given /^my project is linked to a github repository$/ do
  @repository = FactoryGirl.create(:repository, project: @project)
end

Given /^I have a new story with a couple of scenarios$/ do
  @story = FactoryGirl.create(:story, project: @project)
end

When /^I start the story$/ do
  visit project_path(@project)
  within ".story_#{@story.id}" do
    click_link t('story.start')
  end
end

Then /^the story should be assigned to me$/ do
  @story.assignee.should == @user
  @story.assignee.should_not be_nil
end

Then /^the story should be started$/ do
  @story.reload.status.should eql(:started)
end

Then /^my github repository should have a new branch with the new feature added$/ do
  @repository.branches.select { |b|
    b.name == @story.short_name
  }.should have_any?
end

Then /^my github repository should have a pull\-request with the story description$/ do
  @repository.pull_requests.select { |b|
    b.name == @story.name
  }.should have_any?
end
