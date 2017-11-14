# encoding: utf-8

def item_lists
  items = []
  # 商品検索、必要な情報を取得してパースする
  Item.joins(:product).select("*").each do |item|
    parsed_item = {}

    parsed_item["name"] = item.name
    parsed_item["price"] = item.price
    parsed_item["sold_out"] = item.stock > 0
    parsed_item["hot"] = item.hot > 0

    items << parsed_item
  end
  items
end



前提(/^: 商品が登録されている$/) do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.start
  system('bundle exec rake db:seed')
end

もし(/^: 商品一覧APIが叩かれたら$/) do
  get "/api/v1/items"
end

ならば(/^: すべての商品情報を取得すること$/) do
  expect(JSON.parse(last_response.body)).to eq(item_lists)
  DatabaseCleaner.clean
end

