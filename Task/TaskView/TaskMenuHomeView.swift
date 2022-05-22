//
//  TaskMenuHome.swift
//  Task
//
//

import SwiftUI

struct TaskMenuHome: View {
    // Init TaskViewModel Observable
    @StateObject var taskModel: TaskViewModel = .init()
    // Init animation namespace
    @Namespace var animation
    @Environment(\.self) var env
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // Vertical Stack for title
            VStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("Upcoming Tasks")
                        .font(.custom("Helvetica Neue", size: 25).bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                // Calling nav items to be 
                NavbarItems()
                    .padding(.top, 4)
                    .padding(.bottom, 10)
                // Hard coded task card what it is meant to look like
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 180){
                        VStack(alignment: .leading){
                            Text("Example Task")
                                .font(.custom("Helvetica Neue", size: 20))
                                .padding(10)
                            Text("Date Due:")
                                .font(.custom("Helvetica Neue", size: 15))
                                .padding(10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Circle()
                            .fill(.red)
                            .frame(width: 25, height:25)
                            .padding()
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.yellow)
                }
            }
            .padding()
        }
        // Add task button
        .overlay(alignment: .bottom){
            Button{
                taskModel.openEditTask.toggle()
            } label: {
                Label {
                    Text("Add Task")
                        .font(.custom("Helvetica Neue", size: 20))
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "square.and.arrow.up")
                }
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(.blue, in: Capsule())
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
        }
        // Pressing addTask button will move to a full screeen cover of options
        .fullScreenCover(isPresented: $taskModel.openEditTask){
            taskModel.resetTaskData()
        } content: {
        AddTaskView()
            .environmentObject(taskModel)
        }
    }
    
    
    // Custom segment for navbar menu items
    @ViewBuilder
    func NavbarItems()->some View{
        // Tabs for the different status's
        let tabs = ["Upcoming", "Completed"]
        HStack(spacing: 10){
            ForEach(tabs,id: \.self){ tab in
                Text(tab)
                    .font(.custom("Helvetica Neue", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(taskModel.currentTab == tab ? .white : .green)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background{
                        if taskModel.currentTab == tab{
                            Capsule()
                                .fill(.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            taskModel.currentTab = tab
                        }
                    }
                
            }
        }
    }
}

struct TaskMenuHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
