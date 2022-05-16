//
//  TaskMenuHome.swift
//  Task
//
//

import SwiftUI

struct TaskMenuHome: View {
    @StateObject var taskModel: TaskViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // Vertical Stack for title
            VStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("Welcome Back!")
                        .font(.custom("Helvetica Neue", size: 20))
                    Text("Upcoming Tasks")
                        .font(.custom("Helvetica Neue", size: 25).bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                NavbarItems()
            }
            .padding()
        }
    }
    
    // Custome segment for navbar menu items
    @ViewBuilder
    func NavbarItems()->some View{
        let tabs = ["Upcoming", "Completed"]
        HStack(spacing: 10){
            ForEach(tabs,id: \.self){ tab in
                Text(tab)
                    .font(.custom("Helvetica Neue", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(taskModel.currentTab == tab ? .white : .black)
                
            }
        }
    }
}

struct TaskMenuHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
