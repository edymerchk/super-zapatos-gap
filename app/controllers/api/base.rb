module API
  class Base < Grape::API
    mount API::Stores
    mount API::Articles
  end
end