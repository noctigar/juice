module API
  module V1
    class Items < Grape::API
      class ItemEmptyError < StandardError
        attr_accessor :error_message

        def initialize(message)
          self.error_message = message
        end
      end

      class PaymentError < StandardError
        attr_accessor :error_message

        def initialize(message)
          self.error_message = message
        end
      end

      helpers do
        # 商品一覧APIメソッド
        def item_lists
          items = []

          # 商品検索、必要な情報を取得してパースする
          Item.joins(:product).select("*").each do |item|
            parsed_item = {}

            parsed_item[:name] = item.name
            parsed_item[:price] = item.price
            parsed_item[:sold_out] = item.stock > 0
            parsed_item[:hot] = item.hot > 0

            items << parsed_item
          end

          raise ItemEmptyError.new("商品が見つかりませんでした。") if items.blank?

          items
        # 商品が一つもない場合
        rescue ItemEmptyError => e
          Rails.logger.error(e)
          e.error_message
        end

        # 商品購入API
        def buy
          product = Item.find(params[:id]).product

          raise PaymentError.new("料金が足りません。") if product.price > params[:payment]
          raise ItemEmptyError.new("#{product.name}は現在売り切れ中です。") if product.stock <= 0

          SalesLog.create!( trader: product.trader,
                            product: product,
                            sold_price: product.price,
                            sold_at: Time.zone.now )

          { name: product.name,
            change: params[:payment] - product.price,
            sold_time: Time.zone.now }

        rescue PaymentError, ItemEmptyError => e
          Rails.logger.error(e)
          e.error_message
        end
      end

      resource :items do
        # GET /api/v1/items
        desc '商品一覧API'
        get do
          item_lists
        end

        # GET /api/v1/items/{:id}/buy
        desc '商品購入API'

        params do
          requires :id, type: Integer, desc: 'item_id'
          requires :payment, type: Integer, desc: '投入金額'
        end

        get ':id/buy' do
          buy
        end
      end
    end
  end
end
