import Alamofire
import Foundation

public struct MyFirstSwiftPackage {
    public var text = "Hello, World!"
    var delegate: ResponseProtocol?

    public init() {
        
    }
    
    func callGetAPI<T: Codable>(url: URL,type: T.Type) {
        let dict : [String : Any] = ["Key":"Value","status":0]
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) else { return }
        guard let response = try? JSONDecoder().decode(T.self, from: data) else { return }
        delegate?.returnsData(data: response, type: T.self)
    }
}

protocol ResponseProtocol {
    func returnsData<T: Codable>(data: T, type: T.Type)
}
