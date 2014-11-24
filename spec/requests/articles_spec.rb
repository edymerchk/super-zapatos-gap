describe API do

  include AuthHelper

  before(:each) do
    @headers = headers
  end

  describe "GET /services/articles" do

    context "With Articles in the DB" do

      let!(:article) { create(:article)}
      let!(:article2) { create(:article)}

      it "returns the response the articles" do

        get "/services/articles", nil, @headers
        json = JSON.parse(response.body).with_indifferent_access

        expect(json[:total_elements]).to eq 2
        expect(json[:articles].collect{|article| article[:id]}).to include(article.id, article2.id)
      end

    end

    context "Without Articles in the DB" do

      it "returns the response with 0 elements" do

        get "/services/articles", nil, @headers
        json = JSON.parse(response.body).with_indifferent_access

        expect(json[:total_elements]).to eq 0
      end
    end

    context "Response Structure and Status" do

      it "returns a propper json structure with 200 status" do

        get "/services/articles", nil, @headers
        json = JSON.parse(response.body).with_indifferent_access

        expect(response.status).to eq(200)
        expect(json.has_key?(:success)).to be true
        expect(json.has_key?(:total_elements)).to be true
        expect(json.has_key?(:articles)).to be true
      end
    end
  end

  describe "GET /services/articles/stores:id" do

    let!(:store1) { create(:store) }
    let!(:store2) { create(:store) }
    let!(:article1) { create(:article, store: store1) }
    let!(:article2) { create(:article, store: store2) }

    it "returns only the articles for the specific store" do

      get "/services/articles/stores/#{store1.id}", nil, @headers
      json = JSON.parse(response.body).with_indifferent_access

      expect(json[:articles].collect{|article| article[:id]}).to include(article1.id)
      expect(json[:articles].collect{|article| article[:id]}).to_not include(article2.id)
    end

  end
end