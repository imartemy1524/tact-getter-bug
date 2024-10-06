import "@stdlib/deploy";
struct UserData{
    nickname: String?;
    avatar: String?;
}

contract TactBug with Deployable {
    // a lot of random properties
    nickname: String? = null;
    avatar: String? = null;

    init(){}
    get fun data(): UserData{
        return UserData {
            nickname: self.nickname,
            avatar: "some random string, which for some reasons always null"
        };
    }
}
