module API
  class Stores < Grape::API

    include API::Defaults

    resource :stores do
      desc "Return list of all stores"
      get do
        stores = Store.all
        present :stores, stores, with: API::Entities::Store
        present :success, true
        present :total_elements, stores.size
      end
    end
  end
end