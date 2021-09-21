require 'rails_helper'

describe Apod do
  it "returns a 200 success header when the API call is made" do
    response = Apod.get_posts
    expect(response.code).to(eq(200))
  end
end