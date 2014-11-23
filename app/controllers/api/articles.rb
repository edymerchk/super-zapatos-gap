module API
  class Articles < Grape::API
    format :json

    resource :articles do
      desc "Return list of all artciles"
      get do
        Article.all
      end
    end
  end
end