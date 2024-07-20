//
//  MoviesViewModelProtocol.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import Combine

protocol MoviesViewModelProtocol {
    var reloadMoviesTablePublisher: AnyPublisher<Void, Never> { get }
    var showLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var showErrorPublisher: AnyPublisher<Error, Never> { get }
    
    var moviesCategory: MoviesCategory { get }
    var movieCellVMsList: [MovieTableCellViewModel] { get }
    var hasMoreToLoad: Bool { get }

    func fetchMoviesForCategory(shouldShowLoading: Bool)
}
