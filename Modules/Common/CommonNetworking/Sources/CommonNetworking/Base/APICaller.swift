//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

protocol APICaller {
    var baseUrl: String { get }
    var session: URLSession { get }
}

extension APICaller {
    
    // default implementation
    // override if needed
    var session: URLSession { .shared }
    
    func request(for endPoint: String, method: String) -> Result<URLRequest, APIError> {
        let urlString = "\(baseUrl)/\(endPoint)"
        guard let url = URL(string: urlString) else {
            return .failure(.invalidURL(urlString))
        }
        return .success(URLRequest(url: url))
    }
    
    func httpGet<Response: Codable>(for endPoint: String) async -> Result<Response, APIError> {
        switch request(for: endPoint, method: "GET") {
        case .success(let request):
            return await processRequest(request)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func processRequest<Response: Codable>(_ request: URLRequest) async -> Result<Response, APIError> {
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.responseError(response, "Response is not HTTPURLResponse"))
            }
            return processHTTPResponse(httpResponse, data: data)
        } catch {
            return .failure(.requestError(request, error))
        }
    }
    
    private func processHTTPResponse<Response: Codable>(_ httpResponse: HTTPURLResponse, data: Data) -> Result<Response, APIError> {
        switch httpResponse.statusCode {
        case 200..<299:
            do {
                return .success(try JSONDecoder().decode(Response.self, from: data))
            }
            catch {
                return .failure(.decodeError(data, error))
            }
        default:
            return .failure(.unexpectedStatusCode(httpResponse.statusCode))
        }
    }
}
