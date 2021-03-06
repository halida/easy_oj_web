require 'spec_helper'

describe "challenges/edit" do
  before(:each) do
    @challenge = assign(:challenge, stub_model(Challenge,
      :name => "MyString",
      :desc => "MyString",
      :user_id => 1,
      :level => 1
    ))
  end

  it "renders the edit challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challenges_path(@challenge), :method => "post" do
      assert_select "input#challenge_name", :name => "challenge[name]"
      assert_select "input#challenge_desc", :name => "challenge[desc]"
      assert_select "input#challenge_user_id", :name => "challenge[user_id]"
      assert_select "input#challenge_level", :name => "challenge[level]"
    end
  end
end
