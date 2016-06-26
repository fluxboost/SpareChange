//
//  SpareChangeAPI.swift
//  SpareChangeAPI
//
//  Created by Alex Sanderson on 25/06/2016.
//  Copyright © 2016 Sandatum Limited. All rights reserved.
//

import Foundation

@objc public class SpareChangeAPI: NSObject {

    public var shop = Shop()

    public  var homeless: [HomelessPerson] = []
    private let __homelessPeople = [
        "king.panda",
        "snake.fruit",
        "snake.tree",
        "tree.pear",
        "orange.lime",
        "red.scarf",
        "boat.bush",
        "water.tree",
        "life.apple",
        "book.snake",
        "book.hot",
        "bottle.tree",
        "sand.mars",
        "mars.pluto",
        "plane.tree",
        "blue.moon",
        "moon.wind",
        "air.fire",
        "fire.sand",
        "car.brick",
        "brick.peach",
        "blue.water",
        "glass.paper",
        "original.tree",
        "fast.bear",
        "street.blue",
        "window.glass",
        "road.yellow",
        "flat.organ",
        "church.car",
        "sun.street",
        "firework.sand",
        "crisp.earth",
        "wind.fire",
        "chip.blue",
        "green.chip",
        "electric.works",
        "electric.spark",
        "spark.ruby",
        "gem.stick",
        "green.gem",
        "diamond.rough",
        "steel.wind",
        "mast.cat",
        "dog.book",
        "sky.core",
        "core.earth",
        "ear.whisper",
        "green.marker",
        "blue.light",
    ]

    override init() {
        super.init()

        generateHomelessPeople()
    }

    private func generateHomelessPeople() {
        for (_, name) in __homelessPeople.enumerate() {
            let person = HomelessPerson(handle: name)

            if name == "wind.fire" {
                person.wishList.items.append(shop.getProductWithName("Socks")!)
                person.wishList.items.append(shop.getProductWithName("Toothbrush")!)
                person.wishList.items.append(shop.getProductWithName("Toothpaste")!)
                person.wishList.items.append(shop.getProductWithName("Shaving Foam")!)
                person.wishList.items.append(shop.getProductWithName("Deodorant")!)
            } else {
                person.wishList.items = generateWishListUsingShop()
            }

            homeless.append(person)
        }
    }

    private func generateWishListUsingShop() -> [Product] {
        var list = [Product]()

        for _ in 1...5 {
            list.append(shop.products[Int(arc4random_uniform(UInt32(shop.products.count - 1)) + 1)])
        }

        return list
    }

    public func getHomelessPersonWithHandle(handle: String) -> HomelessPerson? {
        for (_, person) in homeless.enumerate() {
            if person.handle == handle {
                return person
            }
        }

        return nil
    }

    public func purchaseProduct(product: Product, forHomelessPerson person: HomelessPerson) -> Bool {
        if let index = person.wishList.items.indexOf(product) {
            person.wishList.items.removeAtIndex(index)
        }

        return true
    }
}

@objc public class HomelessPerson: NSObject {
    let handle: String
    let location = "Sheffield"

    let wishList = WishList()

    public init(handle: String) {
        self.handle = handle

        super.init()
    }
}

@objc public class WishList: NSObject {
    var items: [Product] = []
}

@objc public class Product: NSObject {
    let name: String
    let price: NSDecimalNumber
    let isSelected:NSNumber = 0

    public init(name: String, price: NSDecimalNumber) {
        self.name  = name
        self.price = price

        super.init()
    }
}

@objc public class Shop: NSObject {
    let products: [Product] = [
        Product(name: "Socks",          price: 4.00),
        Product(name: "Underwear",      price: 5.00),
        Product(name: "Toothbrush",     price: 2.00),
        Product(name: "Toothpaste",     price: 2.00),
        Product(name: "Soap",           price: 1.00),
        Product(name: "Shampoo",        price: 2.00),
        Product(name: "Shaving Foam",   price: 4.00),
        Product(name: "Razor",          price: 2.00),
        Product(name: "Sanitary Pad",   price: 3.00),
        Product(name: "Deodorant",      price: 3.00),
    ]

    public func getProductWithName(name: String) -> Product? {
        for (_, product) in products.enumerate() {
            if product.name == name {
                return product
            }
        }

        return nil
    }
}