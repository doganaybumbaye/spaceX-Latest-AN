//
//  SpaceWidgetX.swift
//  SpaceWidgetX
//
//  Created by Doğanay Şahin on 5.07.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), widgetData: .fake)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, widgetData: .fake)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        
        NetworkService.shared.getLaunchInformation { widgetDatas in
            let entryData = SimpleEntry(date: Date(), configuration: configuration, widgetData: widgetDatas)
            
            entries.append(entryData)
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }

        }


    }


struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let widgetData : LaunchInfo
}

struct SpaceWidgetXEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) private var family
    var body: some View {
        switch family{
        case .systemSmall:
            SmallWidgetView(widgetInfo: entry.widgetData)
        case .systemLarge:
            LargeWidgetView(widgetInfo: entry.widgetData)
        default :
            SmallWidgetView(widgetInfo: entry.widgetData)
        }
            

    }
}

@main
struct SpaceWidgetX: Widget {
    let kind: String = "SpaceWidgetX"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SpaceWidgetXEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemLarge])
    }
}

struct SpaceWidgetX_Previews: PreviewProvider {
    static var previews: some View {
        SpaceWidgetXEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), widgetData: .fake))
//            .previewContext(WidgetPreviewContext(family: [.systemSmall, .systemLarge]))
    }
}
