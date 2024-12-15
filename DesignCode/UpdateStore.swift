//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Nafish 
//

import SwiftUI
import Combine
class UpdateStore: ObservableObject{
    @Published var updates: [update] = updateData
    
}

