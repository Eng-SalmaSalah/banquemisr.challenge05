//
//  MovieDetailsViewController.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit
import Combine

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var movieDetailsTableView: UITableView!
    
    var coordinatorDelegate: MovieDetailsVCCoordinatorDelegate?
    private var cancellables = Set<AnyCancellable>()
    private var viewModel: MovieDetailsViewModelProtocol
        
    required init(viewModel: MovieDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: MovieDetailsViewController.xibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        bindViewModel()
        viewModel.getMovieDetails()
    }
    
    private func setupTableView(){
        if #available(iOS 15.0, *) {
            movieDetailsTableView.sectionHeaderTopPadding = 0
        }
        movieDetailsTableView.register(UINib(nibName: MovieDetailsTableViewSectionHeader.nibName, bundle: nil), forHeaderFooterViewReuseIdentifier:  MovieDetailsTableViewSectionHeader.nibName)
        movieDetailsTableView.register(UINib(nibName: MovieMainDetailsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieMainDetailsTableViewCell.reuseID)
        movieDetailsTableView.register(UINib(nibName: MovieMoreInfoTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieMoreInfoTableViewCell.reuseID)
        movieDetailsTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
        bindUIErrorState(showErrorPublisher: viewModel.showErrorPublisher).store(in: &cancellables)
        bindLoadingState(showLoadingPublisher: viewModel.showLoadingPublisher).store(in: &cancellables)
        bindTableReload(tableView: movieDetailsTableView,
                        reloadPublisher: viewModel.reloadMovieDetailsTablePublisher).store(in: &cancellables)
    }
    
}

extension MovieDetailsViewController: Navigatable {
    func setupNavigationBar() {
        let leftButtonConfig = NavigationBarButtonConfig.back(action: coordinatorDelegate?.didExitMovieDetails)
        let navBarConfigs = NavigationBarConfigs(titleText: viewModel.movieName,
                                                 leftButtonConfigs: leftButtonConfig)
        let navBar = CustomNavigationBarFactory.createNavigationBar(withNavBarConfigs: navBarConfigs)
        self.add(navbar: navBar, above: contentView)
    }
}

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return viewModel.movieMoreInfoCellVMsList?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return configureMainDetailsCell(for: tableView, at: indexPath)
        case 1:
            return configureMoreInfoCell(for: tableView, at: indexPath)
        default:
            return UITableViewCell()
        }
    }
 
    private func configureMainDetailsCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseID = MovieMainDetailsTableViewCell.reuseID
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? MovieMainDetailsTableViewCell
        else { return UITableViewCell()}
        if let movieMainDetailsCellViewModel = viewModel.movieMainDetailsCellViewModel {
            cell.configureWithCellVM(cellVM: movieMainDetailsCellViewModel)
        }
        return cell
    }
    
    private func configureMoreInfoCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseID = MovieMoreInfoTableViewCell.reuseID
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? MovieMoreInfoTableViewCell,
              let cellVM = viewModel.movieMoreInfoCellVMsList?[safe: indexPath.row]
        else { return UITableViewCell()}
        cell.configureWith(infoTitle: cellVM.infoType.infoTitle, infoValue: cellVM.infoValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            guard let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieDetailsTableViewSectionHeader.nibName) as? MovieDetailsTableViewSectionHeader else { return nil }
            sectionHeader.configureWith(sectiontitle: "moreInfoTitle".localized)
            return sectionHeader
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return UITableView.automaticDimension
        }
        return 0
    }
}
