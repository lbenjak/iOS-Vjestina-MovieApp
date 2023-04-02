import UIKit
import PureLayout
import MovieAppData

public class MovieDetailsViewController: UIViewController {
    private var movieDetails = MovieUseCase().getDetails(id: 111161)
    
    private var headlineView: UIView!
    private var overviewView: UIView!
    
    private var userScorePointsDescriptionLabel: UILabel!
    private var userScorePointsLabel: UILabel!
    private var movieTitle: UILabel!
    private var movieGenres: UILabel!
    private var movieReleaseDate: UILabel!
    private var movieDurationTime: UILabel!
    private var movieImage: UIImageView!
    private var starSymbolImage: UIImageView!
    private var circleSymbolImage: UIImageView!
    
    private var overviewTitle: UILabel!
    private var overviewText: UILabel!
    private var characters: UICollectionView!
    private var cellIdentifier = "cellId"
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
    }
    
    private func buildViews() {
        buildHeadlineView()
        buildOverviewView()
        defineFinalLayoutConstraints()
    }
    
    private func buildHeadlineView() {
        createHeadlineView()
        styleHeadlineView()
        defineLayoutForHeadlineView()
    }
    
    private func buildOverviewView() {
        createOverviewView()
        styleOverviewView()
        defineLayoutForOverviewView()
        
    }

    private func createHeadlineView() {
        headlineView = UIView()
        
        generateMovieTitle()
        headlineView.addSubview(movieTitle)
        
        generateUserScoreElements()
        
        generateMovieGenresElement()
        
        generateDateReleaseElement()
        headlineView.addSubview(movieReleaseDate)
        
        generateDurationTimeElement()
        
        generateCoverImageElement()
        headlineView.addSubview(movieImage)
        
        generateFavoriteTagElement()
        headlineView.addSubview(circleSymbolImage)
        circleSymbolImage.addSubview(starSymbolImage)
    }

    private func styleHeadlineView() {
        movieImage.contentMode = .scaleAspectFill
        movieImage.clipsToBounds = true
        
        circleSymbolImage.image = UIImage(systemName: "circle.fill")?.withTintColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1), renderingMode: .alwaysOriginal)
        starSymbolImage.image = UIImage(systemName: "star")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        movieDurationTime.textColor = .white
        movieGenres.textColor = .white
        movieReleaseDate.textColor = .white
        movieTitle.textColor = .white
        userScorePointsLabel.textColor = .white
        userScorePointsDescriptionLabel.textColor = .white
        
        userScorePointsLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        movieDurationTime.font = UIFont.boldSystemFont(ofSize: 16.0)
        movieTitle.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    private func defineLayoutForHeadlineView() {
        
        circleSymbolImage.autoPinEdge(.bottom, to: .bottom, of: headlineView, withOffset: -20)
        circleSymbolImage.autoPinEdge(.left, to: .left, of: headlineView, withOffset: 20)
        circleSymbolImage.autoSetDimensions(to: CGSize(width: 32, height: 32))
        starSymbolImage.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9))
        
        let genresAndTimeDuration = UIView()
        headlineView.addSubview(genresAndTimeDuration)
        
        genresAndTimeDuration.autoPinEdge(.bottom, to: .top, of: circleSymbolImage, withOffset: -16)
        genresAndTimeDuration.autoPinEdge(.left, to: .left, of: headlineView, withOffset: 20)
        genresAndTimeDuration.autoPinEdge(.right, to: .right, of: headlineView, withOffset: -20)
        
        genresAndTimeDuration.addSubview(movieGenres)
        movieGenres.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .right)
        genresAndTimeDuration.addSubview(movieDurationTime)
        
        headlineView.bringSubviewToFront(genresAndTimeDuration)
        
        movieDurationTime.autoPinEdge(.left, to: .right, of: movieGenres, withOffset: 5)
        
        movieReleaseDate.autoPinEdge(.bottom, to: .top, of: movieGenres, withOffset: -5)
        movieReleaseDate.autoPinEdge(.left, to: .left, of: headlineView, withOffset: 20)

        headlineView.bringSubviewToFront(movieReleaseDate)
        
        movieTitle.autoPinEdge(.bottom, to: .top, of: movieReleaseDate, withOffset: -16)
        movieTitle.autoPinEdge(.left, to: .left, of: headlineView, withOffset: 20)
        movieTitle.autoPinEdge(.right, to: .right, of: headlineView, withOffset: -16)
        
        headlineView.bringSubviewToFront(movieTitle)
        
        let userScoreWithLabel = UIView()
        headlineView.addSubview(userScoreWithLabel)
        
        userScoreWithLabel.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -16)
        userScoreWithLabel.autoPinEdge(.left, to: .left, of: headlineView, withOffset: 20)
        userScoreWithLabel.addSubview(userScorePointsLabel)
        
        userScorePointsLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .right)
        userScoreWithLabel.addSubview(userScorePointsDescriptionLabel)
        userScorePointsDescriptionLabel.autoPinEdge(.left, to: .right, of: userScorePointsLabel, withOffset: 5)
        
        headlineView.bringSubviewToFront(userScoreWithLabel)
        
        
        movieImage.autoPinEdgesToSuperviewEdges()
    }
    
    private func createOverviewView() {
        overviewView = UIView()
        
        overviewTitle = UILabel()
        overviewTitle.text = "Overview"
        overviewView.addSubview(overviewTitle)
        
        overviewText = UILabel()
        overviewText.numberOfLines = 0
        overviewText.text = movieDetails!.summary
        overviewView.addSubview(overviewText)
        
//        characters = UICollectionView()
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
//        characters.collectionViewLayout = flowLayout
//        characters.dataSource = self
//        characters.delegate = self
        
    }
    
    private func styleOverviewView() {
        overviewView.backgroundColor = .white
        
        overviewTitle.textColor = UIColor(displayP3Red: 11/255, green: 37/255, blue: 63/255, alpha: 1)
        overviewTitle.font = UIFont.boldSystemFont(ofSize: 20)
        overviewText.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    private func defineLayoutForOverviewView() {
        overviewTitle.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 22, left: 20, bottom: 0, right: 20), excludingEdge: .bottom)
        
        overviewText.autoPinEdge(.top, to: .bottom, of: overviewTitle, withOffset:8.38)
        
        overviewText.autoPinEdge(.left, to: .left, of: overviewView, withOffset: 16)
        overviewText.autoPinEdge(.right, to: .right, of: overviewView, withOffset: -16)
    }
    
    private func defineFinalLayoutConstraints() {
        view.addSubview(headlineView)
        headlineView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        headlineView.autoSetDimension(.height, toSize: 327)

        view.addSubview(overviewView)
        overviewView.autoPinEdge(.top, to: .bottom, of: headlineView)
        overviewView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
    
    private func generateMovieTitle() {
        movieTitle = UILabel()
        movieTitle.text = movieDetails!.name + " (" + String(movieDetails!.year) + ")"
        movieTitle.numberOfLines = 0
    }
    
    private func generateUserScoreElements() {
        userScorePointsLabel = UILabel()
        userScorePointsLabel.text = String(movieDetails!.rating)
        
        userScorePointsDescriptionLabel = UILabel()
        userScorePointsDescriptionLabel.text = "User score"
    }
    
    private func generateMovieGenresElement() {
        movieGenres = UILabel()
        movieGenres.text = extractGenresToString()
    }
    
    private func generateDateReleaseElement() {
        movieReleaseDate = UILabel()
        movieReleaseDate.text = convertToDifferentDateFormat(movieDetails!.releaseDate)
    }
    
    private func generateDurationTimeElement() {
        movieDurationTime = UILabel()
        movieDurationTime.text = extractDurationAsString(for: movieDetails!.duration)
    }
    
    private func generateCoverImageElement() {
        movieImage = UIImageView()
        movieImage.image =  UIImage(named: "theShawshankRedemption")
    }
    
    private func generateFavoriteTagElement() {
        circleSymbolImage = UIImageView()
        starSymbolImage = UIImageView()
    }
    
    private func extractGenresToString() -> String {
        var genres: String = ""
        
        for genre in movieDetails!.categories{
            genres += genres + fromCategoryEnumToString(genre) + ", "
        }
        genres.remove(at: genres.index(genres.endIndex, offsetBy: -2))
        
        return genres
    }
    
    private func fromCategoryEnumToString(_ category: MovieAppData.MovieCategoryModel) -> String{
        switch category {
        case MovieCategoryModel.action: return "Action"
        case MovieCategoryModel.adventure: return "Adventure"
        case MovieCategoryModel.comedy: return "Comedy"
        case MovieCategoryModel.crime: return "Crime"
        case MovieCategoryModel.drama: return "Drama"
        case MovieCategoryModel.fantasy: return "Fantasy"
        case MovieCategoryModel.romance: return "Romance"
        case MovieCategoryModel.scienceFiction: return "Science Fiction"
        case MovieCategoryModel.thriller: return "Thriller"
        case MovieCategoryModel.western: return "Western"
        }
    }
    
    private func convertToDifferentDateFormat(_ unformattedDate: String) -> String {
        let dateFormatterFromStringToDate = DateFormatter()
        dateFormatterFromStringToDate.dateFormat = "yyyy/MM/dd"
        
        let date = dateFormatterFromStringToDate.date(from: unformattedDate)
        
        let dateFormatterFromDateToString = DateFormatter()
        dateFormatterFromDateToString.dateFormat = "dd/MM/yyyy"
        
        let formattedDateString = dateFormatterFromDateToString.string(for: date)
        
        return formattedDateString!
    }
    
    private func convertFromMinutesToHours(_ minutes: Int) -> (hours: Int, minutes: Int) {
        return (minutes / 60, (minutes % 60))
    }
    
    private func extractDurationAsString(for durationInHours: Int) -> String {
         let convertedTime = convertFromMinutesToHours(durationInHours)
        return String(convertedTime.hours) + "h " + String(convertedTime.minutes) + "m"
        
    }
}

extension MovieDetailsViewController: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDetails!.crewMembers.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CrewMemberCell
        
        cell.crewMemberName.text = movieDetails?.crewMembers[indexPath.row].name
        cell.crewMemberPosition.text = movieDetails?.crewMembers[indexPath.row].role
    
        return cell
    }
    
    class CrewMemberCell: UICollectionViewCell {
        var crewMemberName = UILabel()
        var crewMemberPosition = UILabel()
        
    }
}
