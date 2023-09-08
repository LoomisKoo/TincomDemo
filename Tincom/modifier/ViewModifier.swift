//
//  ButtonModifier.swift
//  Tincom
//
//  Created by Loomis Koo on 2023/7/20.
//

import Foundation
import SwiftUI

// MARK: View的圆角hover效果

private struct HoverEffectModifier: ViewModifier {
    private var conerRadius: CGFloat = 0
    private var hPadding: CGFloat = 0
    private var vPadding: CGFloat = 0

    init(conerRadius: CGFloat, hPadding: CGFloat, vPadding: CGFloat) {
        self.conerRadius = conerRadius
        self.hPadding = hPadding
        self.vPadding = vPadding
    }

    func body(content: Content) -> some View {
        content
            .buttonStyle(.plain)
            .contentShape(RoundedRectangle(cornerRadius: conerRadius))
            .clipShape(RoundedRectangle(cornerRadius: conerRadius))
            .hoverEffect()
            .padding(.horizontal, hPadding)
            .padding(.vertical, vPadding)
    }
}

// MARK: View的圆形hover效果

private struct HoverCircleEffectModifier: ViewModifier {
    private var hPadding: CGFloat = 0
    private var vPadding: CGFloat = 0

    init(hPadding: CGFloat, vPadding: CGFloat) {
        self.hPadding = hPadding
        self.vPadding = vPadding
    }

    func body(content: Content) -> some View {
        content
            .buttonStyle(.plain)
            .contentShape(Circle())
            .hoverEffect()
            .padding(.horizontal, hPadding)
            .padding(.vertical, vPadding)
    }
}

// MARK: View的胶囊hover效果

private struct HoverCapsuleEffectModifier: ViewModifier {
    private var hPadding: CGFloat = 0
    private var vPadding: CGFloat = 0

    init(hPadding: CGFloat, vPadding: CGFloat) {
        self.hPadding = hPadding
        self.vPadding = vPadding
    }

    func body(content: Content) -> some View {
        content
            .buttonStyle(.plain)
            .contentShape(Capsule())
            .hoverEffect()
            .padding(.horizontal, hPadding)
            .padding(.vertical, vPadding)
    }
}

extension View {
    /// 圆角矩形的hover
    func hoverRadiusEffect(
        _ cornerRadius: CGFloat,
        hPadding: CGFloat = 0,
        vPadding: CGFloat = 0
    ) -> some View {
        modifier(HoverEffectModifier(conerRadius: cornerRadius, hPadding: hPadding, vPadding: vPadding))
    }

    /// 圆角矩形hover（标准padding）
    func hoverRadiusEffect(
        _ cornerRadius: CGFloat
    ) -> some View {
        modifier(HoverEffectModifier(conerRadius: cornerRadius, hPadding: 0, vPadding: 0))
    }

    /// 胶囊形的hover
    func hoverCapsuleEffect(
        hPadding: CGFloat = 0,
        vPadding: CGFloat = 0
    ) -> some View {
        modifier(HoverCapsuleEffectModifier(hPadding: hPadding, vPadding: vPadding))
    }

    /// 胶囊形的hover（标准padding）
    func hoverCapsuleEffect() -> some View {
        modifier(HoverCapsuleEffectModifier(hPadding: 0, vPadding: 0))
    }

    /// 圆形hover
    func hoverCircleEffect(
        hPadding: CGFloat = 0,
        vPadding: CGFloat = 0
    ) -> some View {
        modifier(HoverCircleEffectModifier(hPadding: hPadding, vPadding: vPadding))
    }

    /// 圆形hover（标准padding）
    func hoverCircleEffect() -> some View {
        modifier(HoverCircleEffectModifier(hPadding: 0, vPadding: 0))
    }
}
