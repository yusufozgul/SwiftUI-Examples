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
    var body: some View
    {
        VStack
            {
                Text("Bir diğer ekrana ulaştınız")
                    .padding()
                PresentationLink(destination: ThirdView())
                {
                    Text("Presentation Link kullanarak \ndiğer sayfaya geçin")
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding()
                }
        }
    }
}

#if DEBUG
struct SecondView_Previews : PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
#endif
