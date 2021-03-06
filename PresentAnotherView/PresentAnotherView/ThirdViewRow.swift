//
//  ThirdViewRow.swift
//  PresentAnotherView
//
//  Created by Yusuf Özgül on 10.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct ThirdViewRow : View {
    var city: String
    var body: some View {
        Text(city)
    }
}

#if DEBUG
struct ThridViewRow_Previews : PreviewProvider {
    static var previews: some View {
        ThirdViewRow(city: "City")
    }
}
#endif
