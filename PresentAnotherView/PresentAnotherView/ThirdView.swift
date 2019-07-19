//
//  ThirdView.swift
//  PresentAnotherView
//
//  Created by Yusuf Özgül on 10.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct ThirdView : View
{
    var listElement = ["Antalya", "İzmir", "İstanbul", "Ankara", "Muğla", "Çanakkale", "Bursa", "Adana"]
    var body: some View
    {
        return NavigationView
            {
                List
                    {
                        ForEach(listElement.identified(by: \.self)) { element in
                            NavigationLink(destination: FourthView(city: element))
                            {
                                ThridViewRow(city: element)
                            }
                        }
                        .navigationBarTitle(Text("Bir Şehir Seçin"))
                }
        }
    }
}

#if DEBUG
struct ThirdView_Previews : PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
#endif
