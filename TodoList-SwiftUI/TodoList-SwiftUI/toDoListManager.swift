//
//  toDoListManager.swift
//  TodoList-SwiftUI
//
//  Created by Yusuf Özgül on 17.07.2019.
//  Copyright © 2019 Yusuf. All rights reserved.
//

import Foundation
import SwiftUI

public class toDoListManager
{
    private init() { }
    
    public static let shared = toDoListManager()
    
    var delegate: toDoListDelegate?
    var dataList: [toDoData] = []
    
    func save(data: toDoData)
    {
        dataList.append(data)
        delegate?.update(list: dataList)
    }
}
public struct toDoData
{
    public var title: String
    public var desc: String
    public var date: String
    public var image: Image
    
    init(date: Date, desc: String, title: String, image: Image)
    {
        self.date = date.dateToText()
        self.title = title
        self.desc = desc
        self.image = image
    }
}



protocol toDoListDelegate
{
    func update(list: [toDoData])
}

extension Date
{
    func dateToText() -> String
    {
        let dateFormantter = DateFormatter()
        dateFormantter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormantter.string(from: self)
    }
}
extension String
{
    func stringToDate() -> Date
    {
        let dateFormantter = DateFormatter()
        dateFormantter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormantter.date(from: self) ?? Date()
    }
}
