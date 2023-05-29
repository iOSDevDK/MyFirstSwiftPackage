import Alamofire
import Foundation

public struct MyFirstSwiftPackage {
    public var text = "Hello, World!"

    public init() {

    }
    
    func callGetAPI<T: Codable>(url: URL?,type: T.Type, completion: @escaping (Result<T,NSError>) -> Void) {
        guard let _ = url else {
            completion(.failure(NSError(domain: "URL not available", code: 0)))
            return
        }
        let dict : [String : Any] = ["Key":"Value","status":0]
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) else { return }
        guard let response = try? JSONDecoder().decode(T.self, from: data) else { return }
        completion(.success(response))
    }
}
