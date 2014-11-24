describe ArticlesController do

  context "GET Actions" do
    before :each do
      @article = create(:article)
    end
    describe "GET #index" do

      it "shows a list of @articles" do
        get :index
        expect(assigns(:articles)).to eq [@article]
      end
    end
    describe 'GET #show' do

      it "assigns the requested article to @article" do
        get :show, id: @article
        expect(assigns(:article)).to eq @article
      end
    end
    describe 'GET #new' do

      it "assigns a new article to @article" do
        get :new
        expect(assigns(:article)).to be_a_new(Article)
      end
    end
    describe 'GET #edit' do

      it "assigns the requested article to @article" do
        get :edit, id: @article
        expect(assigns(:article)).to eq @article
      end
    end
  end
  context "POST actions" do
    describe "POST #create -with valid attributes" do

      it "saves the new article in the db" do
        expect{
          post :create, article: attributes_for(:article, store_id: 1)
          }.to change(Article, :count).by(1)
      end

      it "redirects to the articles index page" do
        post :create, article: attributes_for(:article, store_id: 1)
        expect(response).to redirect_to articles_path
      end
    end
    describe "POST #create  with invalid attributes" do

      it "does not save the article in the database" do
        expect{
          post :create,
          article: attributes_for(:invalid_article)
          }.to_not change(Article, :count)
      end
    end
  end


  context "PUT actions" do
    describe "PUT #update" do
      let(:article) { create(:article) }

      it "updates the attributes" do
        put :update, id: article, article: {name: "New Name"}
        expect(article.reload.name).to eq "New Name"
      end
    end
  end

  context "DELETE actions" do
    describe "DELETE #destroy" do
      let!(:article) { create(:article) }

      it "deletes the article" do
        expect{
          delete :destroy, id: article
        }.to change(Article, :count).by(-1)
      end
    end
  end
end

