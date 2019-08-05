//
//  ContentView.swift
//  Alert, ActionSheet-SwiftUI
//
//  Created by Yusuf Özgül on 4.08.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State var isShowAlert = false
    @State var isShowActionSheet = false
    
    
    var body: some View
    {
        VStack
        {
            Button(action: {
                self.isShowAlert = true
            }) {
                Text("Show Alert")
                .padding()
            }
            
            Button(action: {
                self.isShowActionSheet = true
            }) {
                Text("Show Action Sheet")
                .padding()
            }
        }
        .alert(isPresented: $isShowAlert) {
            Alert(
                title: Text("Title"),
                message: Text("message"),
                primaryButton: .default(Text("Ok!")),
                secondaryButton: .default(Text("Button"), action: {
                    print("Button")
                })
            )
        }
        .actionSheet(isPresented: $isShowActionSheet) {
            ActionSheet(
                title: Text("Title"),
                message: Text("Message"),
                buttons: [
                    
                    .destructive(Text("Button 1"), action: {
                        print("Button 1")
                    }),
                    .default(Text("Button 2"), action: {
                        print("Button 2")
                    }),
                    .default(Text("OK"), action: {
                        print("Click")
                    }),
                    .cancel(Text("Cancel"))
                
                ]
            )
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
