//
//  ContentView.swift
//  MyFrirendList
//
//  Created by Sy Lee on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State var showProfileView = false
    
    var body: some View {
        ZStack {
            //노란 배경
            Rectangle()
                .foregroundColor(.yellow)
                .ignoresSafeArea()
            //친구 리스트
            List {
                ForEach(vm.friendList) { friend in
                    FriendCellView(friend)
                        .onTapGesture {
                            showProfileView = true
                        }.sheet(isPresented: $showProfileView) {
                            ProfileView(friend)
                        }
                }
                .listRowBackground(Color.yellow)
            }
            .listStyle(.plain)
        } //ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
