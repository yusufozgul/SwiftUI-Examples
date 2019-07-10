//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Yusuf Özgül on 9.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var buttonsText = ["AC", "±", "%", "÷",
                       "7", "8", "9", "x",
                       "4", "5", "6", "-",
                       "1", "2", "3", "+",
                       "0", "00", ".", "="]
    @State var screenValue = "0"
    var calculator = Calculator()
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text(screenValue)
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .onEnded { _ in
                                self.screenValue = self.calculator.deleteLast()
                        }
                )
                Divider()
            }
            
            ForEach((0...4)) { firstIndex in
                HStack(alignment: .bottom)
                {
                    ForEach((0...3)) { secondIndex in
                        ZStack {
                            Circle()
                                .frame(width: 75, height: 75, alignment: .center)
                                .foregroundColor(self.getColor(firstIndex: firstIndex, secondIndex: secondIndex))
                                .padding(10)
                                .tapAction {
                                    self.touchButton(button: self.buttonsText[(firstIndex * 4) + secondIndex])
                            }
                            
                            Text(self.buttonsText[(firstIndex * 4) + secondIndex])
                                //                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .color(.white)
                                .bold()
                                .font(.title)
                                .tapAction { // :(
                                    self.touchButton(button: self.buttonsText[(firstIndex * 4) + secondIndex])
                            }
                        }
                    }
                }
            }
        }
    }
    func getColor(firstIndex: Int, secondIndex: Int) -> Color
    {
        if firstIndex == 0 && secondIndex != 3
        { return .init(red: 0.65, green: 0.65, blue: 0.65) }
        
        if secondIndex == 3
        { return .orange }
        
        return .init(red: 0.20, green: 0.20, blue: 0.20)
    }
    
    func touchButton(button: String)
    {
        if Int(button) != nil || button == "."
        {
            screenValue = calculator.getDigit(button)
        }
        else if button == "+" || button == "-" || button == "x" || button == "÷" || button == "%"
        {
            screenValue = calculator.getOperand(button)
        }
        else if button == "="
        {
            screenValue = calculator.calculate()
        }
        else if button == "AC"
        {
            screenValue = calculator.reset()
        }
        else if button == "±"
        {
            screenValue = calculator.negativePositive()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
