require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :sender => nil,
        :recipient => nil,
        :balance => 2,
        :note => "MyText"
      ),
      Transaction.create!(
        :sender => nil,
        :recipient => nil,
        :balance => 2,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
