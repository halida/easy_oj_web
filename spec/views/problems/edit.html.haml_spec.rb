require 'spec_helper'

describe "problems/edit" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem,
      :name => "MyString",
      :desc => "MyString",
      :user_id => 1,
      :show_error => false,
      :demo_input => "MyText",
      :demo_output => "MyText",
      :input => "MyText",
      :output => "MyText"
    ))
  end

  it "renders the edit problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => problems_path(@problem), :method => "post" do
      assert_select "input#problem_name", :name => "problem[name]"
      assert_select "input#problem_desc", :name => "problem[desc]"
      assert_select "input#problem_user_id", :name => "problem[user_id]"
      assert_select "input#problem_show_error", :name => "problem[show_error]"
      assert_select "textarea#problem_demo_input", :name => "problem[demo_input]"
      assert_select "textarea#problem_demo_output", :name => "problem[demo_output]"
      assert_select "textarea#problem_input", :name => "problem[input]"
      assert_select "textarea#problem_output", :name => "problem[output]"
    end
  end
end
