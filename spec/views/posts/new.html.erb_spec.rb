require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :header => "",
      :body => ""
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_header[name=?]", "post[header]"

      assert_select "input#post_body[name=?]", "post[body]"
    end
  end
end
