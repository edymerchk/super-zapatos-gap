describe API do

  include AuthHelper

  before(:each) do
    @headers = headers
  end

  describe "GET /services/stores" do

    context "With Stores in the DB" do

      let!(:store) { create(:store)}
      let!(:store2) { create(:store)}

      it "returns the response the stores" do

        get "/services/stores", nil, @headers
        json = JSON.parse(response.body).with_indifferent_access

        expect(json[:total_elements]).to eq 2
        expect(json[:stores].collect{|store| store[:name]}).to include(store.name, store2.name)
      end

    end

    context "Without Stores in the DB" do

      it "returns the response with 0 elements" do

        get "/services/stores", nil, @headers
        json = JSON.parse(response.body).with_indifferent_access

        expect(json[:total_elements]).to eq 0
      end
    end

    context "Response Structure and Status" do

      it "returns a propper json structure with 200 status" do

        get "/services/stores", nil, @headers
        json = JSON.parse(response.body).with_indifferent_access

        expect(response.status).to eq(200)
        expect(json.has_key?(:success)).to be true
        expect(json.has_key?(:total_elements)).to be true
        expect(json.has_key?(:stores)).to be true
      end
    end

  end
end