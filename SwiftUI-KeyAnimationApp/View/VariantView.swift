//
//  VariantView.swift
//  SwiftUI-KeyAnimationApp
//
//  Created by Saumil Shah on 24/06/24.
//

import SwiftUI

struct VariantView: View {

    // MARK: - variables -
    var index: Int
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        let variant = self.viewModel.getVariant(index: index)
        
        Circle()
            .frame(width: 20, height: 20)
            .padding(5)
            .foregroundColor(Color(hex: variant.color))
            .overlay(
                Group {
                    if variant.isSelected {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(hex: variant.color), lineWidth: 2)
                    } else {
                        EmptyView()
                    }
                }
            )
            .onTapGesture {
                viewModel.selectVariant(index: index)
            }        
    }
}
