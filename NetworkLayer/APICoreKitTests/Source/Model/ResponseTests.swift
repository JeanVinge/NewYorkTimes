
@testable import APICoreKit

import XCTest

class ResponseTests: XCTestCase {

    let fakeURL = URL(string: "https//example.com")!

    func test_whenStatusCode200() throws {
        for n in 200...299 {
            let urlResponse = HTTPURLResponse(url: fakeURL,
                                              statusCode: n,
                                              httpVersion: nil,
                                              headerFields: nil)
            let response = Response(data: Data(),
                                    response: urlResponse)

            XCTAssertNotNil(try? response.handleStatusCode())
        }
    }

    func test_unknownStatusCode() {
        let urlResponse = HTTPURLResponse(url: fakeURL,
                                          statusCode: 300,
                                          httpVersion: nil,
                                          headerFields: nil)
        let response = Response(data: Data(),
                                response: urlResponse)

        let expec = expectation(description: "Expect that status code returns APIErrors.status error enum.")
        do {
            _ = try response.handleStatusCode()
        } catch {
            expec.fulfill()
        }
        wait(for: [expec], timeout: 0.5)
    }

    func test_whenStatusCode400() throws {
        for n in 400...499 {
            let urlResponse = HTTPURLResponse(url: fakeURL,
                                              statusCode: n,
                                              httpVersion: nil,
                                              headerFields: nil)
            let response = Response(data: Data(),
                                    response: urlResponse)

            let expec = expectation(description: "Expect that status code returns APIErrors.clientError error enum.")
            do {
                _ = try response.handleStatusCode()
            } catch {
                expec.fulfill()
            }
            wait(for: [expec], timeout: 0.5)
        }
    }

    func test_whenStatusCode500() throws {
        for n in 500...599 {
            let urlResponse = HTTPURLResponse(url: fakeURL,
                                              statusCode: n,
                                              httpVersion: nil,
                                              headerFields: nil)
            let response = Response(data: Data(),
                                    response: urlResponse)

            let expec = expectation(description: "Expect that status code returns APIErrors.serverError error enum.")
            do {
                _ = try response.handleStatusCode()
            } catch {
                expec.fulfill()
            }
            wait(for: [expec], timeout: 0.5)
        }
    }
}
