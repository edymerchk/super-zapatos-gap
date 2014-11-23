module API
  class Stores < Grape::API
    format :json

    resource :stores do
      desc "Return list of all stores"
      get do
        Store.all
      end
    end
  end
end