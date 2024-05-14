//
//  FormCommentTileViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

extension FormCommentTileView {
    class ViewModel: ObservableObject {
        @Published private(set) var formCommentTileData: FormCommentTile?
        var isFormMistake: Bool

        init(formCommentTileData: FormCommentTile?, isFormMistake: Bool = false) {
            self.formCommentTileData = formCommentTileData
            self.isFormMistake = isFormMistake
        }
    }
}
