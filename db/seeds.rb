# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

traders = Trader.create([{ name: "Coca-Cola" }, { name: "サントリー" }, { name: "pokka" }])

Product.create( [{ trader: traders.first, name: "コカ・コーラ", price: 120, stock: 10},
                 { trader: traders.first, name: "アクエリアス", price: 120, stock: 10 },
                 { trader: traders.first, name: "FantaGrape", price: 120, stock: 0 },
                 { trader: traders.second, name: "烏龍茶", price: 120, stock: 10 },
                 { trader: traders.second, name: "DAKARA", price: 120, stock: 10 },
                 { trader: traders.second, name: "C.C.Remon", price: 120, stock: 0 },
                 { trader: traders.last, name: "coffee", price: 120, stock: 10, hot: true },
                 { trader: traders.last, name: "coffee", price: 120, stock: 10 },
                 { trader: traders.last, name: "カフェ・オ・レ", price: 120, stock: 10 },
                 { trader: traders.last, name: "tea", price: 120, stock: 0 }] )

Product.all.each do |product|
  Item.create(trader: product.trader, product: product)
end
