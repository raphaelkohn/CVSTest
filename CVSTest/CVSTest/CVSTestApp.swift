//
//  CVSTestApp.swift
//  CVSTest
//
//  Created by Raphael Kohn on 10/12/23.
//

import SwiftUI
import EasyDI
import NetworkLibrary

@main
struct CVSTestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            FlickerCollectionView(viewModel: FlickerViewModel())
        }
    }
}
