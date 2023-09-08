//
//  ChatWindowView.swift
//  visionDemo
//
//  Created by Loomis Koo on 2023/8/11.
//

import SwiftUI

// MARK: 聊天窗口

struct ChatWindowView: View {
    @Binding var selectedContact: ContactInfoData?
    @State private var inputText: String = ""

    init(selectedContact: Binding<ContactInfoData?>) {
        _selectedContact = selectedContact
    }

    var body: some View {
        VStack(spacing: 0) {
            /// 聊天框顶部
            getHeader()
                .padding(15)
                .padding(.trailing, 10)

            Divider()

            /// 聊天框
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        if let list = selectedContact?.msgList {
                            ForEach(list, id: \.self) { msg in
                                /// 消息item
                                getMessageItemView(msg)
                            }
                            .onChange(of: selectedContact, { _, newValue in
                                scrollToBottom(proxy: proxy, newValue: newValue)
                            })
                            .onAppear {
                                scrollToBottom(proxy: proxy, newValue: selectedContact)
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }

            Divider()

            InputWindowView(inputText: $inputText)
                .onChange(of: inputText) { _, newValue in
                    if newValue.last == "\n" {
                        inputText.removeLast()
                        let sendData = ContactViewModel().getMessage(text: inputText)
                        selectedContact?.msgList.append(sendData)
                        inputText = ""
                    }
                }
        }
    }

    /// 聊天框顶部
    private func getHeader() -> some View {
        return HStack {
            /// 联系人昵称
            Text(selectedContact?.personalInfo.nickName ?? "")
                .font(.largeTitle)

            Spacer()

            /// 更多 按钮
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .padding(10)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .hoverCircleEffect()
        }
    }

    // MARK: 消息item

    private func getMessageItemView(_ msg: MessageData) -> some View {
        return Group {
            /// 对方发送的消息
            if msg.senderId == selectedContact?.personalInfo.chatId {
                let avatar = selectedContact?.personalInfo.avatarUrl ?? ""
                TextMsgViewLeft(msg: msg.msgText, avatar: avatar)
            }
            /// 自己发送的消息
            else {
                TextMsgViewRight(msg: msg.msgText)
            }
        }
    }

    // MARK: 消息滚动到底部

    private func scrollToBottom(proxy: ScrollViewProxy, newValue: ContactInfoData?) {
        /// 消息滚动到底部
        if let lastMessage = newValue?.msgList.last {
            proxy.scrollTo(lastMessage, anchor: .bottom)
        }
    }
}

#Preview {
    let contect = ContactViewModel().fetcheRecentlyContect().first
    return ChatWindowView(selectedContact: Binding.constant(contect))
}
