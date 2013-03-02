require 'spec_helper'

describe "solutions/edit" do
  before(:each) do
    @solution = assign(:solution, stub_model(Solution,
      :user_id => 1,
      :problem_id => 1,
      :text => "MyText",
      :language => "MyString",
      :token => "MyString",
      :status => "MyString",
      :result => "MyText"
    ))
  end

  it "renders the edit solution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => solutions_path(@solution), :method => "post" do
      assert_select "input#solution_user_id", :name => "solution[user_id]"
      assert_select "input#solution_problem_id", :name => "solution[problem_id]"
      assert_select "textarea#solution_text", :name => "solution[text]"
      assert_select "input#solution_language", :name => "solution[language]"
      assert_select "input#solution_token", :name => "solution[token]"
      assert_select "input#solution_status", :name => "solution[status]"
      assert_select "textarea#solution_result", :name => "solution[result]"
    end
  end
end
