//
//  Network.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-25.
//

import Alamofire
import Foundation

class Network: NetworkProtocol {
    static let shared = Network()
    private let session: Session
    private let decoder: JSONDecoder

    private init(session: Session = Session(), decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func performRequest<T>(_ configuration: any RequestConfiguration, for _: T.Type) async throws -> T where T: Decodable {
        try await request(session: session, configuration: configuration, decoder: decoder)
    }
}
