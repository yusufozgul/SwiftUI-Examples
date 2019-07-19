//
//  FirstView.swift
//  TodoList-SwiftUI
//
//  Created by Yusuf Özgül on 10.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

// base: https://github.com/JakeLin/Todo

import SwiftUI

struct ContentView : View
{
    @State var toDoList: [toDoData] = []
    var body: some View
    {
        NavigationView
            {
            VStack
                {
                PresentationLink(destination: toDoView(title: "", detail: "", isNew: true))
                {
                    Text("Add New")
                        .color(Color.green)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                }
                
                List
                {
                    ForEach(toDoList.identified(by: \.title)) { element in
                        
                        NavigationLink(destination: toDoView(title: element.title,
                                                             detail: element.desc,
                                                             date: element.date.stringToDate(),
                                                             selectedImage: element.image)
                            )
                        {
                            toDoListRow(image: element.image, title: element.title, date: element.date)
                        }
                    }
                        .onDelete(perform: deleteNotes)
                        .onMove(perform: move)
                    }
                    .navigationBarTitle("Todo List")
                    .navigationBarItems(trailing: EditButton())
            }
            .onAppear {
                toDoListManager.shared.delegate = self
                }
        }
    }
    func deleteNotes(at offset: IndexSet)
    {
        if let index = offset.first
        {
            toDoList.remove(at: index)
            toDoListManager.shared.dataList = toDoList
        }
    }
    func move(from source: IndexSet, to destination: Int)
    {
        let reversedSource = source.sorted()
        for index in reversedSource.reversed()
        {
           toDoList.insert(toDoList.remove(at: index), at: destination)
            toDoListManager.shared.dataList = toDoList
        }
    }
}

extension ContentView: toDoListDelegate
{
    func update(list: [toDoData])
    {
        toDoList = list
    }
    
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
