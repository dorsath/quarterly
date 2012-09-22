Given /^I am logged in$/ do
  log_in new_user
end

Given /^I am at my dashboard$/ do
  visit '/'
end

When /^I fill in the project name$/ do
  @name = Faker::Lorem.words.join(' ')
  within "#new_project" do
    fill_in "project[name]", with: @name
  end
end

When /^I click on "create project"$/ do 
  within "#new_project" do
    click_button t('project.create')
  end
end

Then /^I should have a new project$/ do
  Project.count.should == 1
  Project.last.name.should eql(@name)
end

Given /^I have a project$/ do
  @project = FactoryGirl.create(:project)
end

When /^I click on the delete link of the project$/ do
  within ".project_#{@project.id}" do
    click_link t('general.delete')
  end
end

When /^I confirm$/ do
  #step does nothing but is there for the customer
end

Then /^the project should be deleted$/ do
  Project.get(@project).should be_nil
end
