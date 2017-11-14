module API
  module V1
    class Base < Grape::API
      # http://localhost:3000/api/v1/
      version 'v1'
      format :json

      mount API::V1::Items
    end
  end
end
