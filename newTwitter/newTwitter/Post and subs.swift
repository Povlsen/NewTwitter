// TODO:
// Lav file class og udskift
// Lav user class og udskift
import Foundation

enum PostType{
    case rePost, comment, original
}

class Post {
    var likes: Int = 0
    var rePosts: Int = 0
    var comments: Int = 0
    var poster: User
    var type: PostType
    var parent: Post?
    var mostRecentEventPost: Post?
    
    init(type: PostType, poster: User) {
        self.type = type
        self.poster = poster
    }
    
    convenience init(type: PostType, poster: User, parrentPost: Post) {
        self.init(type: type, poster: poster)
        self.parent = parrentPost
    }
    
    func getPoster() -> User {
        return poster
    }
    
    func rePost(rePoster: User) {
        Post(type: .retweet, poster: rePoster, parrentPost: self)
        self.rePosts += 1
    }
}

class Text : Post {
    var text: String
    init(text: String, type: PostType, poster: User){
        self.text = text
        super.init(type:type, poster: poster)
    }
    
    convenience init(text: String, type: PostType, poster: User, parrentPost: Post) {
        self.init(text: text, type: type, poster: poster)
        super.parent = parrentPost
    }
    
    func rePost(text: String, rePoster: User) {
        // Text(text: text, type: .retweet, poster: rePoster, parrentPost: )
        self.rePosts += 1
    }
    
    func getText () -> String{
        return text
    }
    func setText(text: String) -> Void{
        self.text = text
    }
}

class Photo : Post{
    var file: File
    init(file: File, type: PostType, poster: User){
        self.file = file
        super.init(type:type, poster: poster)
    }
    func getFile () -> File{
        return file
    }
    func setFile(file: File) -> Void{
        self.file = file
    }
}

class TextPhoto : Post {
    var file: File
    var text: String
    init(text: String, file: File, type: PostType, poster: User) {
        self.text = text
        self.file = file
        super.init(type:type, poster: poster)
    }
    func getText () -> String{
        return text
    }
    func setText(text: String) -> Void{
        self.text = text
    }
    func getFile () -> File{
        return file
    }
    func setFile(file: File) -> Void{
        self.file = file
    }
}

