// TODO:
// Lav file class og udskift
// Lav user class og udskift
import Foundation

enum PostType{
    case retweet, comment, original
}

class Post {
    var likes: Int = 0
    var retweets: Int = 0
    var comments: Int = 0
    var poster: User
    var type: PostType
    var parent: Post?
    var mostRecentEventPost: Post?
    init(type: PostType, poster: User){
        self.type = type
        self.poster = poster
    }
    func getPoster() -> User {
        return poster
    }

}

class Text : Post{
    var text: String
    init(text: String, type: PostType, poster: User){
        self.text = text
        super.init(type:type, poster: poster)
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

class TextPhoto : Post{
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

