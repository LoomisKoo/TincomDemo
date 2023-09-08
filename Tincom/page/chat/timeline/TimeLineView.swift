//
//  TimeLineView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/8/25.
//

import SwiftUI

// MARK: 朋友圈

struct TimeLineView: View {
    @State private var itemData = [TimeLineItemData]()

    var body: some View {
        // 朋友圈内容
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                HeaderView()

                if !itemData.isEmpty {
                    Group {
                        ForEach($itemData, id: \.self) { data in
                            TimeLineItemView(data: data)
                        }
                    }
                    .frame(width: 850)
                    .padding(.horizontal, 50)
                }
            }
            .offset(y: -150)
        }
        .frame(maxHeight: .infinity)
        .onAppear {
            itemData = TimeLineViewModel().fetchTimeLineData()
        }
    }
}

// MARK: 头部

private struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            /// 背景
            Image(.bgTimeLineHead)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)

            HStack(spacing: 0) {
                /// 头像
                Image(.icMyAvatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .hoverRadiusEffect(10)
                    .padding(25)

                /// 昵称
                Text("早知")
                    .font(.extraLargeTitle2)
            }
        }
    }
}

#Preview {
    TimeLineView()
        .padding()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
