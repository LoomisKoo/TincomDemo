//
//  ToastView.swift
//  TincomApp
//
//  Created by Loomis Koo on 2023/7/20.
//

import Foundation
import SwiftUI
extension View {
    public func toast(isPresenting: Binding<Bool>, text: String) -> some View {
        modifier(ToastModifier(isShow: isPresenting, text: text))
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isShow: Bool
    var text: String

    private let COUNT_INTERVAL: Double = 1.0

//    @State private var timer: DispatchWorkItem? = nil
    @State private var timer: Timer? = nil
    @State private var timeRemaining: Double = 1.0

    func body(content: Content) -> some View {
        ZStack {
            content
            if isShow {
                Text("\(text)")
                    .font(.largeTitle)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.8))
                    )
                    .offset(z: 200)
            }
        }
        .onChange(of: isShow) { _, newValue in
            if newValue {
                stopTimer()
                startTimer()
            }
        }
    }

    private func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: COUNT_INTERVAL, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= COUNT_INTERVAL
                } else {
                    stopTimer()
                    isShow = false
                }
            }
        }
    }

    private func resetRemaing() {
        timeRemaining = COUNT_INTERVAL
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        resetRemaing()
    }
}
