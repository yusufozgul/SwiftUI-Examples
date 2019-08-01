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
        NavigationView
            {
                List
                    {
                        ForEach(listElement, id: \.self) { element in
                            NavigationLink(destination: FourthView(city: element))
                            {
                                ThirdViewRow(city: element)
                            }
                        }
                        .navigationBarTitle(Text("Bir Şehir Seçin"))
                }
        }
    }
}

struct Citys: Identifiable
{
    var id = UUID()
    var city: String
}
var cityArray = [Citys(city: "Antalya"),
                 Citys(city: "İzmir"),
                 Citys(city: "İstanbul"),
                 Citys(city: "Ankara"),
                 Citys(city: "Muğla"),
                 Citys(city: "Çanakkale"),
                 Citys(city: "Bursa"),
                 Citys(city: "Adana")]

#if DEBUG
struct ThirdView_Previews : PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
#endif
