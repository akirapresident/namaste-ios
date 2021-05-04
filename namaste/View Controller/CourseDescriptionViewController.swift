
//import Cartography
import UIKit
class CourseDescriptionViewController : UIViewController {
    
    var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var imageName = "Course - Yoga para iniciantes"
    
    var playImageName = "Play Duration"
    let image = UIImage(named: "Back Buttom") as UIImage?
    
    var videoId = "7TKoIUVZcAY"
    
    var timeDuration = "Curso | 15 min"
    let timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    var courseDescriptionText = "A prática de exercícios físicos durante a gravidez irá beneficiá-la para uma maior harmonia entre o seu corpo em constante mudança e o prazer de sentir o seu bebê."
    let courseDescriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))

    var courseTitle = "Testing"
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    var textButton = "Retomar curso"
    
    var firstDivider = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
    var secondDivider = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
    
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.minimumLineSpacing = 10
        viewLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        return collectionView
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Image Course
        let imageCourse = UIImage(named: imageName)
        let imageView = UIImageView(image: imageCourse)
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: screenHeight*0.275).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: screenWidth - 40).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            
        // Back Buttom
        let button   = UIButton(type: .custom) as UIButton
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: -10).isActive = true
        button.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -10).isActive = true
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(CourseDescriptionViewController.backButtonPressed), for:.touchUpInside)
        
        // Course Title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.text = courseTitle
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont(name: "Apercu Pro Bold", size: 30)
        self.view.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 28).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: screenWidth - 40).isActive = true

        // Image Duration Player
        let playImage = UIImage(named: playImageName)
        let playImageView = UIImageView(image: playImage)
        let playImageHeight = 60
        let playImageWidth = 60
        view.addSubview(playImageView)
        playImageView.translatesAutoresizingMaskIntoConstraints = false
        playImageView.contentMode = .scaleAspectFit
        playImageView.heightAnchor.constraint(equalToConstant: CGFloat(playImageHeight)).isActive = true
        playImageView.widthAnchor.constraint(equalToConstant: CGFloat(playImageWidth)).isActive = true
        playImageView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        playImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        // Label Time Duration
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textAlignment = NSTextAlignment.left
        timeLabel.text = timeDuration
        timeLabel.font = UIFont(name: "Apercu Regular", size: 14)
        timeLabel.textColor = UIColor.Theme.darkGray
        self.view.addSubview(timeLabel)
        timeLabel.leftAnchor.constraint(equalTo: playImageView.leftAnchor, constant: CGFloat(playImageWidth+10)).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: playImageView.centerYAnchor).isActive = true

        // Course Description
        courseDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        courseDescriptionLabel.textAlignment = NSTextAlignment.left
        courseDescriptionLabel.text = courseDescriptionText
        courseDescriptionLabel.font = UIFont(name: "Apercu Regular", size: 16)
        courseDescriptionLabel.textColor = UIColor.Theme.darkGray
        self.view.addSubview(courseDescriptionLabel)
        courseDescriptionLabel.widthAnchor.constraint(equalToConstant: screenWidth-40).isActive = true
        courseDescriptionLabel.leftAnchor.constraint(equalTo: playImageView.leftAnchor).isActive = true
        courseDescriptionLabel.topAnchor.constraint(equalTo: playImageView.bottomAnchor, constant: 21).isActive = true
        courseDescriptionLabel.lineBreakMode = .byWordWrapping //Word Wrap
        courseDescriptionLabel.numberOfLines = 0

        
        // First Divider
        firstDivider.layer.borderWidth = 1.0
        firstDivider.layer.borderColor = UIColor.Theme.lightGray.cgColor
        self.view.addSubview(firstDivider)
        firstDivider.translatesAutoresizingMaskIntoConstraints = false
        firstDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        firstDivider.widthAnchor.constraint(equalToConstant: screenWidth - 40).isActive = true
        firstDivider.leftAnchor.constraint(equalTo: playImageView.leftAnchor).isActive = true
        firstDivider.topAnchor.constraint(equalTo: courseDescriptionLabel.bottomAnchor, constant: 20).isActive = true

        // Collection View
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: screenHeight*0.143).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: screenWidth - 40).isActive = true
        collectionView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: firstDivider.bottomAnchor, constant: 30).isActive = true
        
        // Second Divider
        secondDivider.layer.borderWidth = 1.0
        secondDivider.layer.borderColor = UIColor.Theme.lightGray.cgColor
        self.view.addSubview(secondDivider)
        secondDivider.translatesAutoresizingMaskIntoConstraints = false
        secondDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        secondDivider.widthAnchor.constraint(equalToConstant: screenWidth - 40).isActive = true
        secondDivider.leftAnchor.constraint(equalTo: playImageView.leftAnchor).isActive = true
        secondDivider.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        
        let videoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        videoButton.backgroundColor = UIColor.Theme.orange
        videoButton.layer.cornerRadius = 25
        videoButton.setTitle(textButton, for: .normal)
        videoButton.titleLabel?.font = UIFont(name: "Apercu Pro Bold", size: 18)
        self.view.addSubview(videoButton)
        videoButton.translatesAutoresizingMaskIntoConstraints = false
        videoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        videoButton.widthAnchor.constraint(equalToConstant: screenWidth - 40).isActive = true
        videoButton.leftAnchor.constraint(equalTo: playImageView.leftAnchor).isActive = true
        videoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        videoButton.addTarget(self, action: #selector(CourseDescriptionViewController.videoButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func videoButtonPressed(sender: UIButton!) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "video") as! VideoViewController
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.videoId = self.videoId
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @objc func backButtonPressed(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
   
    private func setupCollectionView() {
        
        collectionView.register(CourseCollectionCell.self, forCellWithReuseIdentifier: CourseCollectionCell.identifier)
        collectionView.isScrollEnabled = false

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension CourseDescriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionCell.identifier, for: indexPath) as! CourseCollectionCell
        cell.label.text = String(list[indexPath.row])
        
        return cell
        
    }
}

extension CourseDescriptionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/6, height: 50)
       
        
    }
}
