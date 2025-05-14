//
//  MyCustomWidgetExtensionLiveActivity.swift
//  MyCustomWidgetExtension
//
//  Created by MacMini6 on 14/05/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyCustomWidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MyCustomWidgetExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyCustomWidgetExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyCustomWidgetExtensionAttributes {
    fileprivate static var preview: MyCustomWidgetExtensionAttributes {
        MyCustomWidgetExtensionAttributes(name: "World")
    }
}

extension MyCustomWidgetExtensionAttributes.ContentState {
    fileprivate static var smiley: MyCustomWidgetExtensionAttributes.ContentState {
        MyCustomWidgetExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MyCustomWidgetExtensionAttributes.ContentState {
         MyCustomWidgetExtensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MyCustomWidgetExtensionAttributes.preview) {
   MyCustomWidgetExtensionLiveActivity()
} contentStates: {
    MyCustomWidgetExtensionAttributes.ContentState.smiley
    MyCustomWidgetExtensionAttributes.ContentState.starEyes
}
