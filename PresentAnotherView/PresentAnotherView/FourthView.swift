//
//  FourthView.swift
//  PresentAnotherView
//
//  Created by Yusuf Özgül on 10.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct FourthView : View {
    var city: String
    var body: some View {
        NavigationView {
            Text(city)
                .navigationBarTitle(Text("City"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct FourthView_Previews : PreviewProvider {
    static var previews: some View {
        FourthView(city: "City")
    }
}
#endif
