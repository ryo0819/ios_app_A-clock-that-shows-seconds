import SwiftUI

struct ContentView: View {
let timeZones = ["Asia/Tokyo", "America/New_York", "Europe/London", "Europe/Vienna"]
@State private var selectedZone = "Asia/Tokyo"

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1.0)) { context in
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Picker("Select Country", selection: $selectedZone) {
                        ForEach(timeZones, id: \.self) { zone in
                            Text(zone).tag(zone)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.white)

                    Text(dateAndZoneString(date: context.date, identifier: selectedZone))
                        .font(.system(size: 25, design: .monospaced))
                        .foregroundColor(.gray)

                    Text(timeString(date: context.date, identifier: selectedZone))
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                }
            }
        }
    }

    func dateAndZoneString(date: Date, identifier: String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd (EEEE)"
        dateformatter.timeZone = TimeZone(identifier: identifier)
        return dateformatter.string(from: date)
    }

    func timeString(date: Date, identifier: String) -> String {
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "HH:mm:ss"
        timeformatter.timeZone = TimeZone(identifier: identifier)
        return timeformatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
