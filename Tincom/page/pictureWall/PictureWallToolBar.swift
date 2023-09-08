//
//  ToolBar.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/20.
//

import Foundation
import SwiftUI

struct PictureWallToolBar: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
            }, label: {
                Text("item 1")
                    .font(.extraLargeTitle2)
                    .padding()
            })

            Button(action: {
            }, label: {
                Text("item 1")
                    .font(.extraLargeTitle2)
                    .padding()
            })
        }
    }
}

#Preview {
    PictureWallToolBar()
}
