//
//  MovieListTableViewCell.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

import UIKit

final class MovieListTableViewCell: UITableViewCell {
    
    // MARK: - Constant
    
    private enum Constan {
        
    }
    
    // MARK: - Properties
    
    private var movie: Movie? {
        didSet {
            if let movie = movie {
                airDateLabel.text = movie.firstAirDate
                movieNameLabel.text = movie.name
            }
        }
    }

    
    // MARK: - Layout Properties
    
    private var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.shadowColor = Theme.Palette.shadowColor.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var textContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Theme.Palette.labelColor
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private var airDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Theme.Palette.secondaryLabelColor
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private var ratingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Theme.Palette.secondaryLabelColor
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func prepareForReuse() {
        ratingLabel.text = nil
        airDateLabel.text = nil
        movieNameLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(posterImageView)
        containerView.addSubview(textContainerView)
        textContainerView.addSubview(movieNameLabel)
        textContainerView.addSubview(airDateLabel)
        textContainerView.addSubview(ratingLabel)
    }
    
    private func setupConstraints() {
        
    }
    
    // MARK: - Public Methods
    
    func configureCell(item: Movie) {
        movie = item
    }
}
