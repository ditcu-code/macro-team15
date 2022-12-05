//
//  ContentView.swift
//  notifications
//
//  Created by Kaan İzgi on 1.03.2022.
//

import SwiftUI

struct NotifTester: View {
    
    @State var date = Date()
    @State var title = "Wah! Ceroy sudah 2 Bulan!"
    @State var subtitle = "Yuk cek perkembangan Milestone Ceroy bulan ini"
    
    var body: some View {
        
        VStack(spacing:25) {
            
            DatePicker("Date", selection: $date)
                .padding()
            TextField("Title", text: $title)
                .padding()
                .frame(maxWidth:.infinity)
                .background(.gray)
                .cornerRadius(15)
            TextField("Detail", text: $subtitle)
                .padding()
                .frame(maxWidth:.infinity)
                .background(.gray)
                .cornerRadius(16)
            
            
            Button {
                let oneWeekLater = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: Date()) ?? Date()
                let monthAnniv = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
                
                NotificationManager.instance.scheduleNotification(
                    title: "Wah! (babyName) sudah 2 Bulan!",
                    body: "Yuk cek perkembangan Milestone (babyName) bulan ini",
                    date: monthAnniv,
                    type: NotificationType.monthly
                )
                NotificationManager.instance.scheduleNotification(
                    title: "Hey! Tuntun kangen nih!",
                    body: "Yuk lakukan aktivitas bersama (babyName) untuk mendukung pencapaiannya",
                    date: oneWeekLater,
                    type: NotificationType.weekly
                )
                
            } label: {
                Text("Set")
                    .font(.title3)
                    .bold()
                    .frame(height:50)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
            }
            
            Button("remove") {
                NotificationManager.instance.removeNotifications()
            }
            Button("check") {
                let center = UNUserNotificationCenter.current()
                center.getPendingNotificationRequests(completionHandler: { requests in
//                    print(requests.map({$0.content.threadIdentifier}).contains(NotificationType.monthly.rawValue))
//                    print(requests.map({$0.content.threadIdentifier}).contains(NotificationType.weekly.rawValue))
                    print(requests.count)
                    for request in requests {
                        print(request)
                    }
                })
            }
//            Button("remove weekly") {
//                NotificationManager.instance.removeWeeklyNotif()
//            }
            
            
            /*Button {
             NotificationManager.instance.deleteNotification()
             print("cancel")
             } label: {
             Text("Delete notifi")
             .font(.title)
             .bold()
             .frame(height:50)
             .frame(maxWidth:.infinity)
             .foregroundColor(.white)
             .background(.blue)
             .cornerRadius(15)
             }
             .padding()
             */
            Spacer()
        }
        .padding()
        
    }
}


struct NotifTester_Previews: PreviewProvider {
    static var previews: some View {
        NotifTester()
    }
}
