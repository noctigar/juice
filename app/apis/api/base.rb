module API
  class Base < Grape::API
    # http://localhost:3000/api/
    prefix 'api'

    mount API::V1::Base
  end
end
