//
//  PainLevelTileViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-28.
//

import SwiftUI

extension PainLevelTileView {
    class PainLevelTileViewModel: ObservableObject {
        @Published private(set) var painLevel: String?
        
        init(painLevel: String?) {
            self.painLevel = painLevel
        }
    }
}
