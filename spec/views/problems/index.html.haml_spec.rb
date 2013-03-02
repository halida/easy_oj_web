require 'spec_helper'

describe "problems/index" do
  before(:each) do
    assign(:problems, [
      stub_model(Problem,
        :name => "Name",
        :desc => "Desc",
        :user_id => 1,
        :show_error => false,
        :demo_input => "MyText",
        :demo_output => "MyText",
        :input => "MyText",
        :output => "MyText"
      ),
      stub_model(Problem,
        :name => "Name",
        :desc => "Desc",
        :user_id => 1,
        :show_error => false,
        :demo_input => "MyText",
        :demo_output => "MyText",
        :input => "MyText",
        :output => "MyText"
      )
    ])
  end

  it "renders a list of problems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
