require_relative 'support/data_mapper'
require_relative 'support/factory_girl'

load_models('project', 'story')

describe Project do
  it "should not save without a title" do
    subject.name = ""
    subject.valid?.should be_false
  end

  it "should delete the story orphans" do
    subject.name = "Foobar"
    subject.save
    story = FactoryGirl.create(:story, project: subject)

    subject.destroy
    Story.get(story.id).should be_nil
  end
end
