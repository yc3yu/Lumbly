//
//  ErrorViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-04-07.
//

import SwiftUI

extension ErrorView {
    class ViewModel {
        var header: String?
        var errorText: String
        
        init(header: String? = nil, errorText: String) {
            self.header = header
            self.errorText = errorText
        }
    }
}
