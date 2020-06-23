//
//  TableViewErrors.swift
//  Utility
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

enum TableViewErrors: Error {
    case cellNotRegistered(String)
    case unkownCell
}

extension TableViewErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .cellNotRegistered(name):
            return "cell \(name) can't be nil"
        case .unkownCell:
            return "unknown cell"
        }
    }
}
