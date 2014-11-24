module API
  class Articles < Grape::API

    include API::Defaults
    error_formatter :json, API::ErrorFormatter


    resource :articles do
      desc "Return list of all artciles"
      get do
        articles = Article.includes(:store)
        present :articles, articles, with: API::Entities::Article
        present :success, true
        present :total_elements, articles.size
      end


      params do
        requires :id, type: Integer
      end
      get "stores/:id" do
        store = Store.find(params[:id])
        articles = store.articles
        present :articles, articles, with: API::Entities::Article
        present :success, true
        present :total_elements, articles.size
      end
    end
  end
end