require 'spec_helper'

describe "solutions/show" do
  before(:each) do
    @solution = assign(:solution, stub_model(Solution,
      :user_id => 1,
      :problem_id => 2,
      :text => "MyText",
      :language => "Language",
      :token => "Token",
      :status => "Status",
      :result => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/Language/)
    rendered.should match(/Token/)
    rendered.should match(/Status/)
    rendered.should match(/MyText/)
  end
end
