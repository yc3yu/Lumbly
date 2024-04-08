//
//  FormCommentTileViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

struct FormCommentTile: Decodable, Hashable {
    var commentTitle: String?
    var mainImage: String?
    var solution: String?
    var secondaryImage: String?
}

extension FormCommentTileView {
    class FormCommentTileViewModel: ObservableObject {
        @Published private(set) var formCommentTileData: FormCommentTile?
        var isFormMistake: Bool

        init(formCommentTileData: FormCommentTile?, isFormMistake: Bool = false) {
            self.formCommentTileData = formCommentTileData
            self.isFormMistake = isFormMistake
        }
    }
}
