//
//  NotificationManager.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 05/12/22.
//

import Foundation
import UserNotifications

enum NotificationType: String, CaseIterable {
    case monthly = "monthly"
    case weekly = "weekly"
}

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization () {
        let options:UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { succes, error in
            if let error = error {
                print(error)
            } else {
                print("Success Requst")
            }
        }
    }
    
    func scheduleNotification(title: String, body: String, date: Date, type: NotificationType) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        content.badge = 1
        content.threadIdentifier = type.rawValue
        
        let isMonthly = Calendar.current.dateComponents([.day], from: date)
        let isWeekly = Calendar.current.dateComponents([.hour,.minute,.calendar], from: date)
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: type == .monthly ? isMonthly : isWeekly,
            repeats: type == .monthly ? true : false
        )
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
        print("Success")
    }
    
    func setBirthdayNotif(birthDate: Date) {
        scheduleNotification(
            title: "Wah! (babyName) sudah 2 Bulan!",
            body: "Yuk cek perkembangan Milestone (babyName) bulan ini",
            date: birthDate,
            type: NotificationType.monthly
        )
    }
    
    func setWeeklyNotif() {
        let oneWeekLater = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: Date()) ?? Date()
        scheduleNotification(
            title: "Hey! Tuntun kangen nih!",
            body: "Yuk lakukan aktivitas bersama (babyName) untuk mendukung pencapaiannya",
            date: oneWeekLater,
            type: NotificationType.weekly
        )
    }
    
//    func checkNotifAvailable(type: NotificationType) -> Bool {
//        let center = UNUserNotificationCenter.current()
//        var isAvailable: Bool = false
//
//        UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { requests in
//            let threadsId = requests.map({$0.content.threadIdentifier})
//
//            return threadsId.contains(type.rawValue)
//        })
//
//        return isAvailable
//    }
//
    //Delete with ID
    func removeNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
    }
    
}
