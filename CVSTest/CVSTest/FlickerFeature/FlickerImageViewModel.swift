//
//  FlickerImageViewModel.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation

protocol FlickerImageViewModelProtocol: ObservableObject {
    
    var imageUrl: String { get set }
}
