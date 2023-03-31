//
//  PainLevelRatingViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-28.
//

import SwiftUI

extension PainLevelRatingView {
    class PainLevelRatingViewModel: ObservableObject {
        let painLevelOptions: [String] = [L10n.PainLevelTileView.noPain,
                                          L10n.PainLevelTileView.hurtsALittle,
                                          L10n.PainLevelTileView.hurtsALittleMore,
                                          L10n.PainLevelTileView.hurtsEvenMore,
                                          L10n.PainLevelTileView.hurtsAWholeLot,
                                          L10n.PainLevelTileView.hurtsTheWorst]
        
        var recordingViewModel: RecordingView.RecordingViewModel
        
        init(recordingViewModel: RecordingView.RecordingViewModel) {
            self.recordingViewModel = recordingViewModel
        }
        
        // TODO: Save user's selection to server with URL based on information in recordingViewModel
    }
}
