RSpec.describe Scope do
  it "generates random color when created" do
    allow(SecureRandom).to receive(:hex).and_return("123123")

    scope = Scope.create(trello_card_id: "foo")

    expect(scope.color).to eq("#123123")
  end
end
