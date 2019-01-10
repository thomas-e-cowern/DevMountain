import Foundation

//func formatTime (timeInMinutes: Float) -> String {
//
//
//
//    print(timeInMinutes / 60)
//    return "\(timeInMinutes / 60)"
//}
//
//formatTime(timeInMinutes: 72)

func minutesToHoursMinutesSeconds (seconds : Float) -> (Int, Int) {
    print("\(Int(seconds)  % 3600 / 60) hours, \((Int(seconds) % 60)) minutes")
    return (Int(seconds) % 3600 / 60, (Int(seconds) % 60))
}

minutesToHoursMinutesSeconds(seconds: 72)
