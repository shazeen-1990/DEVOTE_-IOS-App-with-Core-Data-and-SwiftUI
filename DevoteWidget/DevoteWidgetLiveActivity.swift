//
//  DevoteWidgetLiveActivity.swift
//  DevoteWidget
//
//  Created by Shazeen Thowfeek on 27/03/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DevoteWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DevoteWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DevoteWidgetAttributes.self) { context in
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

extension DevoteWidgetAttributes {
    fileprivate static var preview: DevoteWidgetAttributes {
        DevoteWidgetAttributes(name: "World")
    }
}

extension DevoteWidgetAttributes.ContentState {
    fileprivate static var smiley: DevoteWidgetAttributes.ContentState {
        DevoteWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: DevoteWidgetAttributes.ContentState {
         DevoteWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: DevoteWidgetAttributes.preview) {
   DevoteWidgetLiveActivity()
} contentStates: {
    DevoteWidgetAttributes.ContentState.smiley
    DevoteWidgetAttributes.ContentState.starEyes
}
