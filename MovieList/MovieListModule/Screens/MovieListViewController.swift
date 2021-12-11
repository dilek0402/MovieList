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
    }
    
    // MARK: - Properties
    
    var viewModel: MovieListViewModel!
    
    // MARK: - Layout Properties
    
    private var movieTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = Theme.Palette.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: Constant.cellId)
        return tableView
    }()
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private  Methods
    
    private func setupUI() {
        self.view.addSubview(movieTableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.view.addConstraints([movieTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                  movieTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                  movieTableView.leadingAnchor.constraint(equalTo: self.view.leftAnchor),
                                  movieTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        self.view.layoutIfNeeded()
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellId,
                                                    for: indexPath) as? MovieListTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    
}

