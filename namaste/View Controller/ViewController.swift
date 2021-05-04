import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var cells = Model().cells

    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = self.screenWidth
        let yourHeight = CGFloat(78)

        return CGSize(width: yourWidth, height: yourHeight)
    }
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.cells[indexPath.row].courseName
        cell.myLabel.lineBreakMode = .byWordWrapping
        cell.myLabel.numberOfLines = 0
        cell.cellImage.image = UIImage(named: self.cells[indexPath.row].image)
        cell.courseDuration.text = self.cells[indexPath.row].courseDuration
        
        return cell
    }
    // Distance Between Item Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "courseDescription") as! CourseDescriptionViewController
        newViewController.modalPresentationStyle = .fullScreen
        
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        newViewController.courseTitle = self.cells[indexPath.row].courseName
        newViewController.timeDuration = self.cells[indexPath.row].courseDuration
        newViewController.imageName = self.cells[indexPath.row].courseDesciptionImage
        newViewController.videoId = self.cells[indexPath.row].url
    }
    
}

