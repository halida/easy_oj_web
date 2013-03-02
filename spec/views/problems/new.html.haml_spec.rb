require 'spec_helper'

describe "problems/new" do
  before(:each) do
    assign(:problem, stub_model(Problem,
      :name => "MyString",
      :desc => "MyString",
      :user_id => 1,
      :show_error => false,
      :demo_input => "MyText",
      :demo_output => "MyText",
      :input => "MyText",
      :output => "MyText"
    ).as_new_record)
  end

  it "renders new problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => problems_path, :method => "post" do
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
