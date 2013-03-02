require 'spec_helper'

describe "solutions/index" do
  before(:each) do
    assign(:solutions, [
      stub_model(Solution,
        :user_id => 1,
        :problem_id => 2,
        :text => "MyText",
        :language => "Language",
        :token => "Token",
        :status => "Status",
        :result => "MyText"
      ),
      stub_model(Solution,
        :user_id => 1,
        :problem_id => 2,
        :text => "MyText",
        :language => "Language",
        :token => "Token",
        :status => "Status",
        :result => "MyText"
      )
    ])
  end

  it "renders a list of solutions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
