module API
  class Stores < Grape::API

    include API::Defaults

    resource :stores do
      desc "Return list of all stores"
      get do
        stores = Store.all
        {
          stores: stores,
          success: true,
          total_elements: stores.size
        }
      end
    end
  end
end