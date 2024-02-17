//
//  NetworkService.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import Foundation

final class NetworkService {
  ///  Define explicit return type to Decode the response
  static func getData<T: Codable>(
    from string: String,
    withParams params: [String: String]?) async throws -> T
  {
    guard var url = URL(string: string) else { throw NetworkError.invalidURL }

    if let params = params {
      let queryItems = params.map { URLQueryItem(name: $0, value: $1) }
      url.append(queryItems: queryItems)
    }
    do {
      let (data, _) = try await URLSession.shared.data(from: url)

      let decoded = try JSONDecoder().decode(T.self, from: data)

      return decoded

    } catch (URLError.badServerResponse) {
      throw NetworkError.badResponse
    } catch (URLError.notConnectedToInternet) {
      throw NetworkError.noConnection
    } catch {
      print(error)
      throw NetworkError.unknown
    }
  }
}

enum NetworkError: Error {
  case invalidURL
  case badResponse
  case noConnection
  case unknown
}
