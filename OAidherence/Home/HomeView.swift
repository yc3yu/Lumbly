//
//  HomeView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationLink(destination: ExerciseSetView()) {
            Text("Go to ExerciseSetView")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
