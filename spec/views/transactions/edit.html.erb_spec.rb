require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :sender => nil,
      :recipient => nil,
      :balance => 1,
      :note => "MyText"
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[sender_id]"

      assert_select "input[name=?]", "transaction[recipient_id]"

      assert_select "input[name=?]", "transaction[balance]"

      assert_select "textarea[name=?]", "transaction[note]"
    end
  end
end
