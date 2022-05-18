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
                color in Circle()
                    .fill(Color(color))
                    .frame(width: 30, height: 30)
                    /*.background{
                        if taskModel.taskColor == color {
                            Circle()
                                .strokeBorder(.black)
                                .padding(-10)
                        }
                    }*/
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
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
