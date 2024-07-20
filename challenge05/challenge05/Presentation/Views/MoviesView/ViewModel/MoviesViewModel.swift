//
//  MoviesViewModel.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import Combine

class MoviesViewModel: MoviesViewModelProtocol {
    private var reloadMoviesTableSubject = PassthroughSubject<Void, Never>()
    var reloadMoviesTablePublisher: AnyPublisher<Void, Never> {
        reloadMoviesTableSubject.eraseToAnyPublisher()
    }
    
    private var showLoadingSubject = PassthroughSubject<Bool, Never>()
    var showLoadingPublisher: AnyPublisher<Bool, Never> {
        return showLoadingSubject.eraseToAnyPublisher()
    }
    
    private var showErrorSubject = PassthroughSubject<Error, Never>()
    var showErrorPublisher: AnyPublisher<Error, Never> {
        showErrorSubject.eraseToAnyPublisher()
    }
    
    var moviesCategory: MoviesCategory
    var movieCellVMsList: [MovieTableCellViewModel] = [MovieTableCellViewModel]()
    var hasMoreToLoad: Bool = false {
        didSet {
            if hasMoreToLoad {
                paginator.currentPageNumber += 1
            }
        }
    }
    
    private let paginator = Paginator()
    private let fetchMoviesUseCase: FetchMoviesUseCase
    
    init(moviesCategory: MoviesCategory,
         fetchMoviesUseCase: FetchMoviesUseCase) {
        self.moviesCategory = moviesCategory
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }
    
    func fetchMoviesForCategory(shouldShowLoading: Bool) {
        if shouldShowLoading {
            showLoadingSubject.send(true)
        }
        fetchMoviesUseCase.fetchMoviesWithCategory(category: moviesCategory,
                                                   pageNumber: paginator.currentPageNumber) { [weak self] result in
            guard let self = self else { return }
            if shouldShowLoading {
                showLoadingSubject.send(false)
            }
            switch result {
            case .success(let moviesResponse):
                self.handleSuccessfulMoviesResponse(response: moviesResponse)
            case .failure(let error):
                self.showErrorSubject.send(error)
            }
        }
    }
    
    private func handleSuccessfulMoviesResponse(response: MoviesResponseModel) {
        hasMoreToLoad = response.totalPages > paginator.currentPageNumber
        let fetchedMoviesCellVMsList = response.results.map {
            MovieTableCellViewModel(movieId: $0.id,
                                    movieName: $0.title,
                                    movieReleaseDate: $0.releaseDate,
                                    moviePosterPath: $0.posterPath)
        }
        movieCellVMsList.append(contentsOf: fetchedMoviesCellVMsList)
        reloadMoviesTableSubject.send()
    }
}
