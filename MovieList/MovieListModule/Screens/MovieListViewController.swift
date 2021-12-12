//
//  MovieListViewController.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 10.12.2021.
//

import UIKit

final class MovieListViewController: UIViewController {
    
    // MARK: - Constant
    
    private enum Constant {
        static let cellId = "reuseIdentifier"
        static let title = "Movies"
    }
    
    // MARK: - Properties
    
    var viewModel: MovieListViewModel!
    var pageCount: Int = 1
    
    // MARK: - Layout Properties
    
    private var movieTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = Theme.Palette.secondaryBackgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: Constant.cellId)
        return tableView
    }()
    
    private var loader: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyling()
        setupUI()
        setupTableView()
        viewModel.delegate = self
        viewModel.fetchMovie(page: pageCount)
    }
    
    // MARK: - Private  Methods
    
    private func setupUI() {
        self.view.addSubview(movieTableView)
        self.view.addSubview(loader)
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.view.addConstraints([movieTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                  movieTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                  movieTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                  movieTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        self.view.addConstraints([loader.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                  loader.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
    }
    
    private func setupTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    private func applyStyling() {
        self.view.backgroundColor = Theme.Palette.backgroundColor
        self.title = Constant.title
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfServices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellId,
                                                    for: indexPath) as? MovieListTableViewCell {
            cell.configureCell(item: viewModel.items[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        viewModel.proceedToMovieDetailViewController(movie: item)
    }
}

// MARK: - ViewModel Delegate
extension MovieListViewController: MovieListViewModelDelegate {
    func moviesLoaded() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
    func loadingActive(state: Bool) {
        DispatchQueue.main.async {
            state ? self.loader.startAnimating() : self.loader.stopAnimating()
        }
    }
}

// MARK: - Paging

extension MovieListViewController {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            pageCount += 1
            if pageCount < viewModel.totalPage {
                viewModel.fetchMovie(page: pageCount)
            }
        }
    }
}

