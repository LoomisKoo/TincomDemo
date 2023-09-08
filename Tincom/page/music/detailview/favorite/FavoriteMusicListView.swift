//
//  FavoriteMusicListView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/7/26.
//

import SwiftUI

// MARK: 喜欢的音乐页面

struct FavoriteMusicListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                heander()
                SongContentView()
                    .padding(.bottom, 10) /// 避免最后一个item被toolBar挡住
            }
        }
        .padding()
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .leading)
    }

    // MARK: 头部

    private func heander() -> some View {
        HStack(spacing: 30) {
            /// 封面
            AsyncImage(url: URL(string: "https://bkimg.cdn.bcebos.com/pic/d62a6059252dd42a2834728ef06d4cb5c9ea15ce12c5?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            }
            .frame(width: 200, height: 200)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .padding(.leading, 20)

            /// 封面右边信息
            VStack(alignment: .leading, spacing: 20) {
                // MARK: 歌单titile

                HStack {
                    Text("歌单")
                        .padding(5)
                        .background(Color(hex: 0x5D9EF8))
                        .cornerRadius(5)

                    Text("我喜欢的音乐")
                        .font(.largeTitle)
                        .opacity(0.8)
                }

                // MARK: 歌单创建者信息

                HStack {
                    Image("ic_my_avatar")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .hoverCircleEffect()

                    Text("LoomisKoo")
                        .font(.system(size: 20))
                        .foregroundColor(.cyan)
                    Text("2023-07-27创建")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }

                // MARK: 功能按钮

                HStack(spacing: 20) {
                    HStack(spacing: 5) {
                        Image(systemName: "play.circle.fill")
                        Text("播放全部")
                            .font(.system(size: 25))
                    }
                    .padding(8)
                    .padding(.horizontal, 10)
                    .background(Color(hex: 0x5D9EF8))
                    .clipShape(Capsule())
                    .hoverCapsuleEffect()

                    // MARK: 收藏

                    FunctionButton(icon: "plus.circle", text: "收藏(0)") {
                    }

                    // MARK: 分享

                    FunctionButton(icon: "square.and.arrow.up", text: "分享(0)") {
                    }

                    // MARK: 下载

                    FunctionButton(icon: "square.and.arrow.down", text: "下载全部") {
                    }
                }

                // MARK: 歌曲数、播放数

                HStack {
                    Text("歌曲数：")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        + Text("1")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.gray)

                    Text("播放数：")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        + Text("0")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

// MARK: 功能按钮

private struct FunctionButton: View {
    private let icon: String
    private let text: String
    private let onClick: () -> Void

    init(icon: String, text: String, _ onClick: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.onClick = onClick
    }

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .opacity(0.6)
            Text(text)
                .font(.system(size: 25))
                .opacity(0.8)
        }
        .padding(8)
        .padding(.horizontal, 10)
        .hoverCapsuleEffect()
        .onTapGesture {
            onClick()
        }
        .background(Capsule().stroke(Color.gray, lineWidth: 1))
    }
}

// MARK: 歌曲信息列表 包括歌曲列表、评论列表、收藏者列表

private struct SongContentView: View {
    @State var curTabType = TabType.SONT_LIST

    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                TabButton("歌曲列表", TabType.SONT_LIST, $curTabType)
                TabButton("评论(99)", TabType.SONT_COMMENT, $curTabType)
                TabButton("收藏者", TabType.SONT_COLLCTOR, $curTabType)

                Spacer()

                SearchView { _ in
                    /// 这里搜索
                }
            }
            .padding(.leading, 20)

            Divider()

            SongListView().opacity(curTabType == TabType.SONT_LIST ? 1 : 0)
            // TODO: 评论收藏列表待实现
        }
    }

    // MARK: 列表tab按钮

    private struct TabButton: View {
        private let text: String
        private let tabType: TabType
        @Binding var curTabType: TabType

        init(
            _ text: String,
            _ tabType: TabType,
            _ curTabType: Binding<TabType>
        ) {
            self.text = text
            self.tabType = tabType
            _curTabType = curTabType
        }

        var body: some View {
            VStack(spacing: 0) {
                Button(action: {
                    curTabType = tabType
                }, label: {
                    Text(text).font(.system(size: 20))
                })
                .padding(5)
                .padding(.horizontal, 5)
                .background(tabType == curTabType ? Color(hex: 0x5D9EF8) : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .hoverRadiusEffect(5)
            }
        }
    }
}

// MARK: 搜索view

private struct SearchView: View {
    @State private var searchWord: String = "" // 直接在结构体内部定义 @State 属性

    @State private var submit: (_ keyword: String) -> Void

    init(_ submit: @escaping (_: String) -> Void) { // 不需要传入 searchWord
        self.submit = submit
    }

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .opacity(0.5)
            TextField("搜索歌单音乐", text: $searchWord)
                .onSubmit {
                    submit(searchWord)
                }
                .frame(width: 150)
                .hoverEffectDisabled()
        }
        .padding(8)
        .background(
            Capsule().fill(.gray.opacity(0.1))
        )
        .hoverCapsuleEffect()
    }
}

// MARK: 歌曲列表

// TODO: 这里用网格布局实现可能比较好

private struct SongListView: View {
    private let vm = FavoriteMusicVM()

    var body: some View {
        LazyVStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer().frame(width: 140)

                Text("歌曲名称")
                    .font(.system(size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("歌手")
                    .font(.system(size: 25))
                    .frame(width: 150, alignment: .leading)
                Text("专辑")
                    .font(.system(size: 25))
                    .frame(width: 300, alignment: .leading)
                Text("时长")
                    .font(.system(size: 25))
                    .frame(width: 100)
            }
            .opacity(0.8)
            .padding(.vertical, 15)

            let dataList = vm.getSongList()

            ForEach(0 ..< dataList.count, id: \.self) { index in
                let item = dataList[index]
                songItemView(index, item)
            }
        }
        .padding(.trailing, 30)
        .frame(maxWidth: .infinity)
    }

    // MARK: 歌曲item

    private func songItemView(_ index: Int, _ data: FavoriteMusicListData) -> some View {
        HStack(spacing: 0) {
            HStack(spacing: 10) {
                /// 序号
                Text("\(index + 1)")
                    .frame(width: 50)
                    .lineLimit(1)
                    .font(.system(size: 25))
                    .foregroundColor(.gray)

                /// 收藏icon
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 20, height: 20)

                ///  是否下载按钮
                if data.hasDownload {
                    Image(systemName: "checkmark.circle.fill")
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(hex: 0x5D9EF8))
                } else {
                    Image(systemName: "square.and.arrow.down")
                        .frame(width: 20, height: 20)
                        .hoverCircleEffect(hPadding: 0, vPadding: 0)
                }
            }
            .padding(.trailing, 15)
            .frame(width: 140)

            /// 歌曲名称
            Text(data.songName)
                .font(.system(size: 25)).bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            /// 歌手
            Text(data.singger)
                .font(.system(size: 25))
                .frame(width: 150, alignment: .leading)

            /// 专辑
            Text(data.album)
                .lineLimit(1)
                .font(.system(size: 25))
                .frame(width: 300, alignment: .leading)

            let m = data.duration / 60
            let s = data.duration % 60
            let duration = String(format: "%02d:%02d", m, s)
            /// 时长
            Text(duration)
                .foregroundColor(.gray)
                .font(.system(size: 20))
                .frame(width: 100)
        }
        .padding(.vertical, 20)
        .hoverRadiusEffect(10, hPadding: 0, vPadding: 0)
    }
}

// MARK: tab类型

private enum TabType {
    case SONT_LIST // 歌曲列表
    case SONT_COMMENT // 评论
    case SONT_COLLCTOR // 收藏者
}

#Preview {
    FavoriteMusicListView()
        .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 20))
}
