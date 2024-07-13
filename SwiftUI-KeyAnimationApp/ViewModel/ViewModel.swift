//
//  ViewModel.swift
//  SwiftUI-KeyAnimationApp
//
//  Created by Saumil Shah on 24/06/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // MARK: - variables -
    static let preview = ViewModel()
    @Published var variants = Variant.all()
    @Published var selectedKeyVarinat = Variant.initialSelectedVariant
    
    // MARK: - functions -
    ///
    /// The func is `getVariant` returns Variant of Index from variants
    ///  A ViewModel's `getVariant` method
    ///
    func getVariant(index: Int) -> Variant {
        return self.variants[index]
    }
    
    ///
    /// The func is `selectVariant` returns Variant of Index from variants
    ///  A ViewModel's `selectVariant` method
    ///
    func selectVariant(index: Int) {
        for vIndex in variants.indices {
            // Toggle isSelected
            variants[vIndex].isSelected = (vIndex == index)
            
            // Select variant
            if variants[index].isSelected {
                selectedKeyVarinat = variants[index]
            }
        }
        
    }
}
