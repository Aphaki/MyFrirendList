//
//  FriendCellView.swift
//  MyFrirendList
//
//  Created by Sy Lee on 2022/05/16.
//

import SwiftUI

struct FriendCellView: View {
    // UserName, PhoneNumber, Email ,Picture(URLString)
    var friend: Friend
    
    init(_ friend: Friend) {
        self.friend = friend
    }
    
//    var imgURLStr = "https://randomuser.me/api/portraits/women/60.jpg"
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: friend.picture.large), scale: 50) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading) {
                Text(friend.name.last)
                    .lineLimit(1)
                    .font(.headline)
                Text(friend.phone)
                    .font(.caption)
            }
            Spacer()
            HStack {
                Text(friend.email)
                    .font(.caption)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .padding(5)
                Image(systemName: "mail")
                    .foregroundColor(.green)
                    .padding(.trailing, 2)
            }.background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.green)
                )
        }
        .padding(3)
        .background(.yellow)
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(Friend.getDummy())
    }
}
