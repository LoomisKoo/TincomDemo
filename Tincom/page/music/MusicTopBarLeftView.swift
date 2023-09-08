//
//  MusicTopBarLeftView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/21.
//

import Foundation
import SwiftUI

struct MusicTopBarLeftView: View {
    var body: some View {
        HStack {

            Image("ic_my_avatar")
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .contentShape(Circle())
                .hoverEffect()

            Text("LoomisKoo").font(.title)
        }
    }
}

#Preview {
    MusicTopBarLeftView()
}
