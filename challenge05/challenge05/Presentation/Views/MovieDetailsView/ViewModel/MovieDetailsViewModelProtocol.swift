//
//  MovieDetailsViewModelProtocol.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import Combine

protocol MovieDetailsViewModelProtocol {
    var reloadMovieDetailsTablePublisher: AnyPublisher<Void, Never> { get }
    var showLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var showErrorPublisher: AnyPublisher<Error, Never> { get }

    var movieName: String { get }
    var movieId: Int { get }
    
    var movieMainDetailsCellViewModel: MovieMainDetailsCellViewModel? { get }
    var movieMoreInfoCellVMsList: [MovieMoreInfoCellViewModel]? { get }
    
    func getMovieDetails()
}
