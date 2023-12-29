//
//  NetworkService.swift
//  MealOrderApp
//
//  Created by Fatih on 29.12.2023.
//

import Foundation

struct NetworkService {
    static let shered = NetworkService()
    private init() {}
    func myFirstRequest() {
        request(route: .temp, method: .get, type: String.self, completion: { _ in })
    }
    
    
    
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters:[String: Any]? = nil,
                                     type: T.Type,
                                     completion: (Result<T,Error>)-> Void) {
        
        guard   let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknowError))
            return
        }
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            var result: Result<Data,Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Cold not Stringify our data "
                print("The response is: \(responseString)")
            } else if  let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
                
            }
            
            DispatchQueue.main.async {
                ////
            }
             
        }.resume()
        
    }
    
    
    
   private  func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let params = parameters {
            switch method {
                
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                urlRequest.httpBody = bodyData
            
            }
        }
        return urlRequest
    }
}
