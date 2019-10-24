require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :sender => nil,
      :recipient => nil,
      :balance => 1,
      :note => "MyText"
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[sender_id]"

      assert_select "input[name=?]", "transaction[recipient_id]"

      assert_select "input[name=?]", "transaction[balance]"

      assert_select "textarea[name=?]", "transaction[note]"
    end
  end
end
