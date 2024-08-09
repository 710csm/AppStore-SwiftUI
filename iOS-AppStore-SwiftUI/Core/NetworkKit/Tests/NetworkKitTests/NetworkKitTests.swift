import XCTest
@testable import NetworkKit

final class NetworkKitTests: XCTestCase {
    private var sut: RemoteMockDataSourceProtocol!
    
    override func setUpWithError() throws {
        sut = RemoteMockDataSource()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWithRemoteMockDataSources() throws {
        Task {
            let result = await sut.fetchMockList()
            
            guard let books = result.results else {
                XCTFail("RemoteMockDataSource에서 데이터를 불러오는데 실패하였습니다!")
                return
            }
            XCTAssertEqual(books.isEmpty, false)
        }
    }
}
