//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by M1 on 12.05.2024.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var cartViewModel: CartViewModel!

    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }

    override func tearDownWithError() throws {
        cartViewModel = nil
    }

    //MARK: Testing functions and networking
    func testAddProduct() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        cartViewModel.addProduct(product: product1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }

    func testAddProductWithID() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        cartViewModel.addProduct(withID: 1)
        XCTAssertEqual(product1.id, 1)
    }
    
    func testAddRandomProduct() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Product2", description: "just product 2", price: 20.5, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", description: "just product 3", price: 17.1, selectedQuantity: 1)
        
        cartViewModel.allProducts = [product1, product2, product3]
        
        cartViewModel.addRandomProduct()
        
        XCTAssertFalse(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testRemoveProduct() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Product2", description: "just product 2", price: 20.5, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", description: "just product 3", price: 17.1, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        cartViewModel.removeProduct(withID: 2)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 2)
    }
    
    func testClearCart() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Product2", description: "just product 2", price: 20.5, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", description: "just product 3", price: 17.1, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        cartViewModel.clearCart()
        
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testTotalPrice() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Product2", description: "just product 2", price: 20.5, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", description: "just product 3", price: 17.1, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        XCTAssertEqual(cartViewModel.totalPrice, 53.1)
    }
    
    func testItemsQuantity() {
        let product1 = Product(id: 1, title: "Product1", description: "just product 1", price: 15.5, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Product2", description: "just product 2", price: 20.5, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", description: "just product 3", price: 17.1, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 3)
    }
    
    // Test fetchProducts
    func testFetchProducts() {
        let expectation = self.expectation(description: "Fetching movies from API")
        
        let apiUrl = URL(string: "https://dummyjson.com/products")!
        
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            
            XCTAssertNil(error, "მოხდა შეცდომა: \(error?.localizedDescription ?? "")")
            XCTAssertNotNil(data, "არ გვაქვს დატა")
            
            do {
                let decoder = JSONDecoder()
                let productResponse = try decoder.decode(productResponse.self, from: data!)
                
                XCTAssertFalse(productResponse.products.isEmpty, "არ გვაქვს ფილმები")
                
                for product in productResponse.products {
                    print(product.id!)
                    XCTAssertNotNil(product.id, "id არ უნდა იყოს nil")
                }
                
                expectation.fulfill()
            } catch {
                XCTFail("ვერ მოხდა დეკოდირება: \(error.localizedDescription)")
            }
        }.resume()
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
}
