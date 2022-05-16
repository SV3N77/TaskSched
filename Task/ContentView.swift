//
//  ContentView.swift
//  Task Scheduler
//
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            TaskMenuHome()
                .navigationTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView();
    }
}
}
