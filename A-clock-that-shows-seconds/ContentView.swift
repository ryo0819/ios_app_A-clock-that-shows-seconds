import SwiftUI

struct ContentView: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1.0)) { context in
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text(dateAndZoneString(date: context.date)).font(.system(size: 25, design: .monospaced))
                        .foregroundColor(.gray)

                    ZStack {
                        Text(timeString(date: context.date))
                            .font(.system(size: 60, weight: .bold, design: .monospaced))
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }

    func dateAndZoneString(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd (zzz)"
        dateformatter.locale = Locale(identifier: "ja_JP")
        return dateformatter.string(from: date)
    }

    func timeString(date: Date) -> String {
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "HH:mm:ss"
        timeformatter.locale = Locale(identifier: "ja_JP")
        return timeformatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
