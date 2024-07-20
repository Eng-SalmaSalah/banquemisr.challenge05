//
//  MovieDetailsViewModel.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import Combine

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    private var showLoadingSubject = PassthroughSubject<Bool, Never>()
    var showLoadingPublisher: AnyPublisher<Bool, Never> {
        return showLoadingSubject.eraseToAnyPublisher()
    }
    
    private var showErrorSubject = PassthroughSubject<Error, Never>()
    var showErrorPublisher: AnyPublisher<Error, Never> {
        showErrorSubject.eraseToAnyPublisher()
    }
    
    private var reloadMovieDetailsTableSubject = PassthroughSubject<Void, Never>()
    var reloadMovieDetailsTablePublisher: AnyPublisher<Void, Never> {
        reloadMovieDetailsTableSubject.eraseToAnyPublisher()
    }

    var movieMainDetailsCellViewModel: MovieMainDetailsCellViewModel?
    var movieMoreInfoCellVMsList: [MovieMoreInfoCellViewModel]?
    
    var movieId: Int
    var movieName: String
    let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    
    init(movieId: Int, movieName: String, fetchMovieDetailsUseCase: FetchMovieDetailsUseCase) {
        self.movieId = movieId
        self.movieName = movieName
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
    }
    
    func getMovieDetails() {
        showLoadingSubject.send(true)
        fetchMovieDetailsUseCase.fetchMovieDetailsWith(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            self.showLoadingSubject.send(false)
            switch result {
            case .success(let movie):
                self.handleSuccessfulMovieDetailsResponse(movie: movie)
            case .failure(let error):
                self.showErrorSubject.send(error)
            }
        }
    }
    
    private func handleSuccessfulMovieDetailsResponse(movie: Movie) {
        handleMainDetails(movie: movie)
        handleMoreInfo(movie: movie)
        self.reloadMovieDetailsTableSubject.send()
    }
    
    private func handleMainDetails(movie: Movie) {
        movieMainDetailsCellViewModel = MovieMainDetailsCellViewModel(movieName: movie.title,
                                                                      movieTagLine: movie.tagline ?? "",
                                                                      moviePosterPath: movie.posterPath ?? "",
                                                                      movieReleaseDate: movie.releaseDate,
                                                                      movieOverview: movie.overview ?? "",
                                                                      movieAverageRate: movie.voteAverage ?? 0.0, 
                                                                      movieRatingsNumber: movie.voteCount ?? 0,
                                                                      forAdults: movie.adult ?? false)
    }
    
    private func handleMoreInfo(movie: Movie) {
        var cellVMsList = [MovieMoreInfoCellViewModel]()
        if let originalTitle = movie.originalTitle, !originalTitle.isEmpty {
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .originalTitle,
                                                          infoValue: originalTitle))
        }
        
        if let status = movie.status, !status.isEmpty {
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .status,
                                                          infoValue: status))
        }
        
        if !movie.releaseDate.isEmpty {
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .releaseDate,
                                                          infoValue: movie.releaseDate))
        }
        
        if let runtime = movie.runtime, runtime > 0 {
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .runtime,
                                                          infoValue: runtime.runtimeDescription))
        }
        
        if let originCountry = movie.originCountry, !originCountry.isEmpty {
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .originCountry,
                                                          infoValue: originCountry.joinedWithSeparator()))
        }
        
        if let originalLanguage = movie.originalLanguage, !originalLanguage.isEmpty {
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .originalLanguage,
                                                          infoValue: originalLanguage))
        }
        
        if let spokenLanguages = movie.spokenLanguages, !spokenLanguages.isEmpty {
            let spokenLangugesNames = spokenLanguages.map { $0.englishName }
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .spokenLanguages,
                                                          infoValue: spokenLangugesNames.joinedWithSeparator()))
        }
        
        if let budget = movie.budget , budget > 0 {
            let currencyCode = movie.originCountry?.first?.currencyCode() ?? ""
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .budget,
                                                          infoValue:"\(budget.roundedToInt) \(currencyCode)"))
        }
        
        if let revenue = movie.revenue {
            let currencyCode = movie.originCountry?.first?.currencyCode() ?? ""
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .revenue,
                                                          infoValue:"\(revenue.roundedToInt) \(currencyCode)"))
        }
        
        if let productionCountries = movie.productionCountries, !productionCountries.isEmpty {
            let productCountriesNames = productionCountries.map { $0.name }
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .productionCountries,
                                                          infoValue: productCountriesNames.joinedWithSeparator()))
        }
        
        if let productionCompanies = movie.productionCompanies, !productionCompanies.isEmpty {
            let productionCompaniesNames = productionCompanies.map { $0.name }
            cellVMsList.append(MovieMoreInfoCellViewModel(infoType: .productionCompanies,
                                                          infoValue: productionCompaniesNames.joinedWithSeparator()))
        }
        
        self.movieMoreInfoCellVMsList = cellVMsList
    }
        
}
