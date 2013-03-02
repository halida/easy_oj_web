require 'spec_helper'

describe "problems/show" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem,
      :name => "Name",
      :desc => "Desc",
      :user_id => 1,
      :show_error => false,
      :demo_input => "MyText",
      :demo_output => "MyText",
      :input => "MyText",
      :output => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Desc/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
