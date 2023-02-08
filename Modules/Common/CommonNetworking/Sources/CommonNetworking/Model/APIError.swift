//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

public enum APIError: Error {
    case invalidURL(String)
    case responseError(URLResponse, String)
    case requestError(URLRequest, Error)
    case decodeError(Data, Error)
    case unexpectedStatusCode(Int)
}
