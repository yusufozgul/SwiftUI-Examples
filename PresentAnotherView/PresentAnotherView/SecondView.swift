//
//  SecondView.swift
//  PresentAnotherView
//
//  Created by Yusuf Özgül on 10.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct SecondView : View
{
    @State var isPresented = false
    var body: some View
    {
        VStack
            {
                Text("Bir diğer ekrana ulaştınız")
                    .padding()
                
                Text("Presentation Link kullanarak \ndiğer sayfaya geçin")
                    .multilineTextAlignment(.center)
                    .padding()
                Button(action: {
                    self.isPresented.toggle()
                    
                }) {
                    Text("GO")
                }
                
//                PresentationLink(destination: ThirdView())
//                {
//                    Text("Presentation Link kullanarak \ndiğer sayfaya geçin")
//                        .lineLimit(Int(2))
//                        .multilineTextAlignment(.center)
//                        .padding()
//                }
            
        }
            .sheet(isPresented: $isPresented, content: { ThirdView() })
        }
    }

#if DEBUG
struct SecondView_Previews : PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
#endif
