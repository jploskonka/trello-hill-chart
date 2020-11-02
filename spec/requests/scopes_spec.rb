RSpec.describe "/scopes" do
  describe "GET /" do
    context "when called without trello_card_ids parameter" do
      it "responds with info about missing parameter" do
        get "/scopes"

        expect(last_response.status).to eq(400)
        expect(JSON.parse(last_response.body)["errors"]["trello_card_ids"]).not_to be_empty
      end
    end

    context "when called with trello_card_ids parameter" do
      before do
        @scopes = [
          Scope.create(trello_card_id: "123"),
          Scope.create(trello_card_id: "456")
        ]
      end

      it "returns array of requested scopes" do
        get "/scopes", trello_card_ids: ["456"]

        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body).length).to eq(1)
        expect(JSON.parse(last_response.body).first["id"]).to eq(@scopes.last.id)
      end
    end
  end
end
