//
//  RecommentMusicBanner.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/28.
//

import SwiftUI

// MARK: 推荐音乐页面的banner

struct RecommentMusicBanner: View {
    @State var currentPage = 0

    private let totalTabs = 4

    @State var timer: Timer?

    var body: some View {
        TabView(selection: $currentPage) {
            Image("banner_recomment_approach")
                .resizable()
            
                .cornerRadius(20)
                .tag(0)

            Image("banner_recomment_meet_you")
                .resizable()
                .cornerRadius(20)
                .tag(1)

            Image("banner_recomment_damage")
                .resizable()
                .cornerRadius(20)
                .tag(2)

            Image("banner_recommend_so_young")
                .resizable()
                .cornerRadius(20)
                .tag(3)
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .tabViewStyle(.page)
        .aspectRatio(3, contentMode: .fit)
//        .frame(width: 800)
//        .frame(maxWidth: .infinity,maxHeight: .infinity)
//        .frame(maxWidth: 800)
        .hoverEffect()
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            DispatchQueue.main.async {
                withAnimation {
                    currentPage = (currentPage + 1) % totalTabs
                }
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    RecommentMusicBanner()
}
