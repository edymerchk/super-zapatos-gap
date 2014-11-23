module API
  class Articles < Grape::API

    include API::Defaults

    resource :articles do
      desc "Return list of all artciles"
      get do
        articles = Article.all
        {
          articles: articles,
          success: true,
          total_elements: articles.size
        }
      end


      get "stores/:id" do
        store = Store.find(params[:id])
        store.articles
      end
    end
  end
end