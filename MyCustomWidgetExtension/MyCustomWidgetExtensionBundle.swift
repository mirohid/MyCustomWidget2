//
//  MyCustomWidgetExtensionBundle.swift
//  MyCustomWidgetExtension
//
//  Created by MacMini6 on 14/05/25.
//

import WidgetKit
import SwiftUI

@main
struct MyCustomWidgetExtensionBundle: WidgetBundle {
    var body: some Widget {
        MyCustomWidgetExtension()
        MyCustomWidgetExtensionControl()
        MyCustomWidgetExtensionLiveActivity()
    }
}
