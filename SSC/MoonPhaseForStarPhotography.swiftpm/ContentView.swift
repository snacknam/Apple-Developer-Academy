import SwiftUI
import AVFoundation


var player: AVAudioPlayer?


struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color("bg")
            StarView()
            MainView()
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            guard let url = Bundle.main.url(forResource: "bgm", withExtension: "mp3") else { return }
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.play()
            } catch (let err) {
                print(err.localizedDescription)
            }
        }
    }
}

struct MainView: View {
    
    @State var today = Date()
    
    var todayMoon = MoonData()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        VStack (spacing: 120) {
            VStack {
                Text("\(today, formatter: dayFormatter)")
                    .foregroundColor(.white)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.today = today
                        }
                    }
                    .font(.system(size: 32, weight: .light))
                Text(todayMoon.moonExpression[moonPhase()].title)
                    .foregroundColor(.white)
                    .font(.system(size: 64, weight: .medium))
            }
            MoonView()
            Text(todayMoon.moonExpression[moonPhase()].description)
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .light))
                .multilineTextAlignment(.center)
                .frame(width: 640)
                .lineSpacing(8)
        }
        .onTapGesture {
            today = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        }
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
