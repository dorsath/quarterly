Given /^I am logged in$/ do
  log_in new_user
end

Given /^I am at my dashboard$/ do
  visit '/'
end

When /^I fill in the project name$/ do
  within "#new_project" do
    fill_in "project[name]", with: Faker::Lorem.words
  end
end

When /^I click on "create project"$/ do 
  within "#new_project" do
    click_link t('project.create')
  end
end

Then /^I should have a new project$/ do
  Project.count.should == 1
end

Given /^I have a project$/ do
  @project = FactoryGirl.create(:project)
end

When /^I click on the delete link of the project$/ do
  within ".project_#{@project.id}" do
    click_link t('actions.delete')
  end
end

When /^I confirm$/ do
  save_and_open_page
  pending("something should happen here")
end

Then /^the project should be deleted$/ do
  @project.exists?
end
