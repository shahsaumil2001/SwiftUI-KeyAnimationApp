//
//  Variant.swift
//  SwiftUI-KeyAnimationApp
//
//  Created by Saumil Shah on 24/06/24.
//

import SwiftUI

struct Variant: Identifiable {
    var id: String
    var color: String
    var isSelected: Bool
}


extension Variant {
    ///
    /// The func is `all` returns initial all data
    ///  A Variant's `all` method
    ///
    static func all() -> [Variant] {
        return [
            Variant(id: KeyVariant.black.rawValue, color: KeyColors.black.rawValue, isSelected: true),
            Variant(id: KeyVariant.grey.rawValue, color: KeyColors.grey.rawValue, isSelected: false),
            Variant(id: KeyVariant.aqua.rawValue, color: KeyColors.aqua.rawValue, isSelected: false),
            Variant(id: KeyVariant.green.rawValue, color: KeyColors.green.rawValue, isSelected: false),
        ]
    }
    
    /// returns default selected variant
    static let initialSelectedVariant = all()[0]
}
