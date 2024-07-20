//
//  MoviesViewController.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit
import Combine

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var moviesTableView: UITableView!
    
    var coordinatorDelegate: MoviesVCCoordinatorDelegate?
    private var cancellables = Set<AnyCancellable>()
    private var viewModel: MoviesViewModelProtocol
        
    required init(viewModel: MoviesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: MoviesViewController.xibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        bindViewModel()
        viewModel.fetchMoviesForCategory(shouldShowLoading: true)
    }

    private func setupTableView(){
        moviesTableView.register(UINib(nibName: MovieTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseID)
        moviesTableView.register(UINib(nibName: PaginationLoadingTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PaginationLoadingTableViewCell.reuseID)
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = 88
    }
    
    private func bindViewModel() {
        bindUIErrorState(showErrorPublisher: viewModel.showErrorPublisher).store(in: &cancellables)
        bindTableReload(tableView: moviesTableView, reloadPublisher: viewModel.reloadMoviesTablePublisher).store(in: &cancellables)
        
        viewModel.showLoadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] showLoading in
                guard let self = self else { return }
                tabBarController?.toggleLoading(isLoading: showLoading)
            }
            .store(in: &cancellables)
    }
    
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieCellVMsList.count + (viewModel.hasMoreToLoad ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < viewModel.movieCellVMsList.count  {
            return configureMovieCell(for: tableView, at: indexPath)
        } else if viewModel.movieCellVMsList.count != 0 {
            return configureLoadingCell(for: tableView, at: indexPath)
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieId = viewModel.movieCellVMsList[safe: indexPath.row]?.movieId,
              let movieName = viewModel.movieCellVMsList[safe: indexPath.row]?.movieName
        else { return }
        coordinatorDelegate?.didSelectMovieWith(movieId: movieId, movieName: movieName)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.movieCellVMsList.count {
            viewModel.fetchMoviesForCategory(shouldShowLoading: false)
        }
    }
    
    private func configureMovieCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseID = MovieTableViewCell.reuseID
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? MovieTableViewCell,
              let cellVM = viewModel.movieCellVMsList[safe: indexPath.row]
        else { return UITableViewCell() }
        
        cell.configureWith(cellVM: cellVM)

        guard let moviePosterPath = cellVM.moviePosterPath else {
            return cell
        }
        
        cell.downloadImageWith(urlString: TMDBImage.imageURL(forPath: moviePosterPath, size: .w300)) { image in
            DispatchQueue.main.async {
                if let updateCell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell {
                    updateCell.moviePosterImageView.image = image
                }
            }
        }
        
        return cell
    }

    private func configureLoadingCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseID = PaginationLoadingTableViewCell.reuseID
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? PaginationLoadingTableViewCell
        else { return UITableViewCell() }
        cell.startAnimating()
        return cell
    }
}

extension MoviesViewController: Navigatable {
    func setupNavigationBar() {
        let navBarConfigs = NavigationBarConfigs(titleText: "moviesTitle".localized)
        let navBar = CustomNavigationBarFactory.createNavigationBar(withNavBarConfigs: navBarConfigs)
        self.add(navbar: navBar, above: contentView)
    }
}
