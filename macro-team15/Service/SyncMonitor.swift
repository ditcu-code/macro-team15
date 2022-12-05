//
//  SyncMonitor.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 05/12/22.
//

import Combine
import CoreData

class SyncMonitor {
    /// Where we store Combine cancellables for publishers we're listening to, e.g. NSPersistentCloudKitContainer's notifications.
    fileprivate var disposables = Set<AnyCancellable>()

    init() {
        NotificationCenter.default.publisher(for: NSPersistentCloudKitContainer.eventChangedNotification)
            .sink(receiveValue: { notification in
                if let cloudEvent = notification.userInfo?[NSPersistentCloudKitContainer.eventNotificationUserInfoKey]
                    as? NSPersistentCloudKitContainer.Event {
                    // NSPersistentCloudKitContainer sends a notification when an event starts, and another when it
                    // ends. If it has an endDate, it means the event finished.
                    if cloudEvent.endDate == nil {
                        print("Starting an event...  SEX") // You could check the type, but I'm trying to keep this brief.
                    } else {
                        switch cloudEvent.type {
                        case .setup:
                            print("Setup finished!  SEX")
                        case .import:
                            print("An import finished!  SEX")
                        case .export:
                            print("An export finished!  SEX")
                        @unknown default:
                            assertionFailure("NSPersistentCloudKitContainer added a new event type.  SEX")
                        }

                        if cloudEvent.succeeded {
                            print("And it succeeded!  SEX")
                        } else {
                            print("But it failed!  SEX")
                        }

                        if let error = cloudEvent.error {
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                    
                }
            })
            .store(in: &disposables)
    }
}
