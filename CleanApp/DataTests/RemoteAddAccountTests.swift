import XCTest

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient){
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(){
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}


class RemoteAddAccountTests: XCTestCase {
    
    func test_add_should_call_httpClient_with_correct_url() throws {
        let url = URL(string: "http://any-url.com")!
        let httpClient = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClient)
        sut.add()
        XCTAssertEqual(httpClient.url, url)
    }
    
    class HttpClientSpy: HttpPostClient{
        var url: URL?
        
        func post(url: URL){
            self.url = url
        }
    }
}
