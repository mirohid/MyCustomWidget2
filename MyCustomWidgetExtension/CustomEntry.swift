import WidgetKit
import SwiftUI

// MARK: - Timeline Entry
struct CustomEntry: TimelineEntry {
    let date: Date
    let title: String
    let subtitle: String
}

// MARK: - Timeline Provider
struct CustomProvider: TimelineProvider {
    func placeholder(in context: Context) -> CustomEntry {
        CustomEntry(date: Date(), title: "Loading...", subtitle: "Please wait")
    }

    func getSnapshot(in context: Context, completion: @escaping (CustomEntry) -> ()) {
        let entry = CustomEntry(date: Date(), title: "Snapshot Title", subtitle: "Snapshot Subtitle")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CustomEntry>) -> ()) {
        let entry = CustomEntry(date: Date(), title: "Live Title", subtitle: "Updated Every 15 Mins")
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }
}

// MARK: - Widget View
struct CustomWidgetEntryView: View {
    var entry: CustomProvider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.title)
                .font(.headline)
                .foregroundColor(.white)

            Text(entry.subtitle)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))

            Spacer()
        }
        .padding()
        .background(Color.blue)
    }
}

// MARK: - Widget Configuration

struct CustomWidget: Widget {
    let kind: String = "CustomWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CustomProvider()) { entry in
            CustomWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Custom Widget")
        .description("Shows a title and subtitle updated periodically.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
