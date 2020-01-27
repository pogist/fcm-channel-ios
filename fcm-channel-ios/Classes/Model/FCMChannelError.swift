//
//  FCMChannelError.swift
//  Alamofire
//
//  Created by Alexandre Azevedo on 02/07/19.
//

import Foundation

public enum FCMChannelError: Error {
    case notFound(message: String?)
    case defaultError(message: String?)
    case mappingError
    case noContact
    case invalidURL
}

extension FCMChannelError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "A url não foi configurada corretamente"
        case .notFound(let message):
            return message ?? "Um erro ocorreu"
        case .defaultError(let message):
            return message ?? "Um erro ocorreu"
        case .mappingError:
            return "Erro ao decodificar contato"
        case .noContact:
            return "Nenhum contato encontrado"
        }
    }
}
