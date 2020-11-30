//
//  ContentView.swift
//  Hacker News
//
//  Created by Amna on 11/20/20.
//  Copyright © 2020 Amna. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkObj = NetworkManager()
    var body: some View {
        NavigationView{
            
            List(networkObj.posts){post in
                NavigationLink(destination:DetialsView(url: post.url) ) {
                    HStack{
                        
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hackers News")
        }
        .onAppear{
            self.networkObj.fetchData()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
