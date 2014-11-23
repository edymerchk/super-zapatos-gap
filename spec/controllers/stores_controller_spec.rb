describe StoresController do

  context "GET Actions" do
    before :each do
      @store = create(:store)
    end
    describe "GET #index" do

      it "shows a list of @stores" do
        get :index
        expect(assigns(:stores)).to eq [@store]
      end
    end
    describe 'GET #show' do

      it "assigns the requested store to @store" do
        get :show, id: @store
        expect(assigns(:store)).to eq @store
      end
    end
    describe 'GET #new' do

      it "assigns a new store to @store" do
        get :new
        expect(assigns(:store)).to be_a_new(Store)
      end
    end
    describe 'GET #edit' do

      it "assigns the requested store to @store" do
        get :edit, id: @store
        expect(assigns(:store)).to eq @store
      end
    end
  end
  context "POST actions" do
    describe "POST #create -with valid attributes" do

      it "saves the new store in the db" do
        expect{
          post :create, store: attributes_for(:store)
          }.to change(Store, :count).by(1)
      end

      it "redirects to the stores index page" do
        post :create, store: attributes_for(:store)
        expect(response).to redirect_to stores_path
      end
    end
    describe "POST #create  with invalid attributes" do

      it "does not save the store in the database" do
        expect{
          post :create,
          store: attributes_for(:invalid_store)
          }.to_not change(Store, :count)
      end
    end
  end


  context "PUT actions" do
    describe "PUT #update" do
      let(:store) { create(:store) }

      it "updates the attributes" do
        put :update, id: store, store: {name: "New Name"}
        expect(store.reload.name).to eq "New Name"
      end
    end
  end

  context "DELETE actions" do
    describe "DELETE #destroy" do
      let!(:store) { create(:store) }

      it "deletes the store" do
        expect{
          delete :destroy, id: store
        }.to change(Store, :count).by(-1)
      end
    end
  end
end

