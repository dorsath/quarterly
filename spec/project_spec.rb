require_relative 'support/data_mapper'

load_models('project', 'story')

describe Project do
  it "should not save without a title" do
    subject.name = ""
    subject.valid?.should be_false
  end
end
