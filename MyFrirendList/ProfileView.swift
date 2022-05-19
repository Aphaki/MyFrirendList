//
//  ProfileView.swift
//  MyFrirendList
//
//  Created by Sy Lee on 2022/05/18.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let urlStr = "https://randomuser.me/api/portraits/women/60.jpg"
    
    var friend: Friend
    
    init(_ friend: Friend) {
        self.friend = friend
    }
    
    var body: some View {
        ZStack {
            Image("TheLake")
                .resizable()
                .ignoresSafeArea()
            // 사진 + 이름 + 구분선 + 버튼 3개
            VStack {
                AsyncImage(url: URL(string: friend.picture.large), scale: 100) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 150)
            }
                Text(friend.name.last)
                    .font(.title2)
                    .foregroundColor(.white)
            Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.top, 20)
                
                // 버튼 3인방
                HStack(spacing: 40){
                    VStack(spacing: 15) {
                        Image(systemName: "message.fill")
                            .frame(height: 40)
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("1:1 채팅")
                            .foregroundColor(.white)
                    }.frame(width: 60)
                    VStack(spacing: 15) {
                        Image(systemName: "phone.fill")
                            .frame(height: 40)
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("통화하기")
                            .foregroundColor(.white)
                    }.frame(width: 60)
                    VStack(spacing: 15) {
                        Image(systemName: "quote.bubble.fill")
                            .frame(height: 40)
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Story")
                            .foregroundColor(.white)
                    }.frame(width: 60)
                }
                .padding(20) // 버튼 3인방
            } // VStack
            .offset(y: 190)
            VStack {
                HStack {
                    Image(systemName: "xmark.circle")
                        .font(.title2)
                    .foregroundColor(.white)
                    .padding(30)
                    .onTapGesture {
                        dismiss()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(Friend.getDummy())
    }
}
