//
//  toDoListRow.swift
//  TodoList-SwiftUI
//
//  Created by Yusuf Özgül on 19.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct toDoListRow : View {
    @State var image: Image
    @State var title: String
    @State var date: String
    var body: some View {
        HStack {
            image
                .frame(width: 30, height: 30, alignment: .center)
                .padding()
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .font(.system(size: 20))
                Text(date)
            }
        }
    }
}

#if DEBUG
struct toDoListRow_Previews : PreviewProvider {
    static var previews: some View {
        toDoListRow(image: Image("red"), title: "title", date: "date")
    }
}
#endif
