//
//  AddTaskView.swift
//  Task
//
//  Created by Wesley Jin on 16/5/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskModel: TaskViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack(spacing: 20){
            Text("Add Task")
                .font(.title2.bold())
                .frame(maxWidth: .infinity)
        .overlay(alignment: .leading) {
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
                
            VStack(alignment: .leading, spacing:20) {
                Text("Choose Task Colour")
                .font(.title2)
                .foregroundColor(.black)
                        
            let colours: [String] = ["Red", "Green", "Blue"]
                        
            HStack(spacing: 40) {
                ForEach(colours, id: \.self){
                    color in RoundedRectangle(cornerRadius: 10)
                    .fill(Color(color))
                    .frame(width: 30, height: 30)
                    /*.background{
                        if taskModel.taskColor == color {
                            Circle()
                                .strokeBorder(.black)
                                .padding(-10)
                        }
                    } background() is deprecated, need to find another function*/
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    /*.onTapGesture {
                        $taskModel.taskColor = color
                    }*/
                    
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            
            Divider()
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing:20) {
                Text("Set Task Date")
                    .font(.title2)
                    .foregroundColor(.black)
                
                Text(taskModel.taskDeadline.formatted(date: .abbreviated, time: .omitted) + ", " + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            /*.overlay(alignment: .bottomTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "calendar")
                        foregroundColor(.gray)
                }
            } calender error*/
            
            Divider()
            
            VStack(alignment: .leading, spacing:20) {
                Text("Enter Task Name")
                    .font(.title2)
                    .foregroundColor(.black)
                
                TextField("Task", text: $taskModel.taskTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
            }
            
            padding(.top, 10)
            
            
            Divider()
            
            Button {
                
            } label: {
                Text("Add Task!")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 10)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
