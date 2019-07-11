//
//  ContentView.swift
//  PresentAnotherView
//
//  Created by Yusuf Özgül on 10.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct FirstView : View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView())
            {
                Text("Navigation Link kullanarak diğer sayfaya geçin")
            }
                .navigationBarTitle("İlk Ekran")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
#endif
