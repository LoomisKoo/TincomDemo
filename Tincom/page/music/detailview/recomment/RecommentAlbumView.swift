//
//  AlbumRecommentView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/22.
//

import Foundation
import SwiftUI

// MARK: 专辑推荐

struct RecommentAlbumView: View {
    /// 专辑整个列表的宽度
    private let gridWidth: CGFloat = 400

    private let itemPadding: CGFloat = 16

    // 专辑item的角度半径
    private let itemConerRadiu: CGFloat = 10

    // 专辑VM，用于获取专辑列表data
    private let vm = RecommentMusicVM()

    var body: some View {
        VStack {
            headerView()
            albumList()
                .frame(maxWidth: .infinity)
        }
        .frame(width: gridWidth)
    }

    private func getItemSize() -> CGFloat {
        return (gridWidth - itemPadding) / 2
    }

    // MARK: header

    private func headerView() -> some View {
        return HStack {
            Text("新碟上架")
                .font(.system(size: 35))
                .padding(.vertical, 3)

            Spacer()

            Button(action: {}, label: {
                Text("更多")
                    .font(.system(size: 25))
                    .padding(7)
            })
            .hoverRadiusEffect(8)
        }
    }

    // MARK: 专辑列表

    private func albumList() -> some View {
        let recommentData = vm.getAlbumList()

        return
            LazyVGridView(columnsCount: 2, hSpacing: itemPadding, vSpacing: itemPadding) {
                ForEach(recommentData, id: \.self) { data in
                    getAlbumItemView(data)
                }
            }
    }

    // MARK: 专辑itemView

    private func getAlbumItemView(_ data: RecommentAlbumData) -> some View {
        return Button(action: {
        }, label: {
            VStack(alignment: .leading) {
                if let url = URL(string: data.cover) {
                    // MARK: 专辑封面

                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                    }

                    .frame(width: getItemSize(), height: getItemSize())
                    .cornerRadius(itemConerRadiu)

                } else {
                    // 如果URL为空，可以在此处设置一个默认图片或占位符视图
                    Color.gray
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                }

                // MARK: 专辑名称

                Text("《\(data.albumName)》")
                    .font(.system(size: 22))
                    .bold()
                    .lineLimit(1)
                    .padding(.vertical, 5)
                    .padding(.leading, 7)
                    .padding(.trailing, 10)

                // MARK: 作者

                Text(data.author)
                    .font(.system(size: 22))
                    .bold()
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)
                    .lineLimit(1)
            }
            .hoverRadiusEffect(itemConerRadiu, hPadding: 0, vPadding: 0)
        })
        .buttonStyle(.plain)
        .shadow(radius: 10)
    }
}

#Preview {
    RecommentAlbumView()
}
