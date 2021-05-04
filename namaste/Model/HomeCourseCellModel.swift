class HomeCourseCellModel {
    
    let image: String
    let courseName: String
    let courseDuration: String
    let courseDesciptionImage: String
    let url: String
    
    internal init(image: String, courseName: String, courseDuration: String, courseDescriptionImage: String, url: String) {
        self.image = image
        self.courseName = courseName
        self.courseDuration = courseDuration
        self.courseDesciptionImage = courseDescriptionImage
        self.url = url
    }
    
}
