//
//  toDoView.swift
//  TodoList-SwiftUI
//
//  Created by Yusuf Özgül on 17.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct toDoView : View
{
    @Environment(\.isPresented) private var isPresented
    let imageNames = ["red", "blue", "pink" , "green", "yellow", "gray"]
    
    @State var title: String
    @State var detail: String
    @State var date: Date = Date()
    @State var selectedImage: Image?
    @State var imageFrameImages: [Color] = [.clear, .clear, .clear, .clear, .clear, .clear]
    @State var isNew = false
    
    var body: some View
    {
        VStack(alignment: .center) {
            
            Spacer()
                .frame(height: 30.0)
            if isNew
            {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0...5) { index in
                            ZStack {
                                Circle()
                                    .frame(width: 70, height: 70, alignment: .center)
                                    .foregroundColor(self.imageFrameImages[index])
                                Circle()
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .foregroundColor(.white)
                                Image(self.imageNames[index])
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .tapAction {
                                        self.selectedImage = Image(self.imageNames[index])
                                        self.selectImage(index)
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                self.selectedImage
                    .frame(width: 100, height: 100, alignment: .center)
            }
            
            
            HStack {
                Text("Title")
                    .bold()
                    .padding()
                TextField("Enter Text", text: $title)
            }
            
            HStack {
                Text("Detail")
                    .bold()
                    .padding()
                TextField("Enter Detail", text: $detail)
            }
            
            DatePicker(
                $date,
                maximumDate: Date()
            )

            Spacer()
            if isNew
            {
                Button(action: {
                    if self.selectedImage != nil && !self.detail.isEmpty && !self.title.isEmpty
                    {
                        let data = toDoData.init(date: self.date,
                                                 desc: self.detail,
                                                 title: self.title,
                                                 image: self.selectedImage ?? Image("red"))
                        
                        toDoListManager.shared.save(data: data)
                        self.detail = ""
                        self.title = ""
                        self.selectedImage = nil
                        self.imageFrameImages = [.clear, .clear, .clear, .clear, .clear, .clear]
                        self.isPresented?.value = false
                    }
                }) {
                    Text("Add")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                        .padding()
                }
            }
            
            Spacer()
        }
    }
    
    func selectImage(_ index: Int)
    {
        imageFrameImages = [.clear, .clear, .clear, .clear, .clear, .clear]
        
        switch index {
        case 0:
            imageFrameImages[index] = Color(red:0.88, green:0.26, blue:0.32)
        case 1:
            imageFrameImages[index] = Color(red: 0.02, green: 0.46, blue: 0.78)
        case 2:
            imageFrameImages[index] = Color(red:0.95, green:0.71, blue:0.92)
        case 3:
            imageFrameImages[index] = Color(red:0.36, green:0.75, blue:0.40)
        case 4:
            imageFrameImages[index] = Color(red:0.96, green:0.86, blue:0.35)
        case 5:
            imageFrameImages[index] = Color(red:0.71, green:0.72, blue:0.73)
        default:
            break
        }
    }
}

#if DEBUG
struct toDoView_Previews : PreviewProvider {
    static var previews: some View {
        toDoView(title: "", detail: "", selectedImage: nil)
    }
}
#endif
