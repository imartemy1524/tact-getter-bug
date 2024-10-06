import "@stdlib/deploy";
struct SubscriptionData{
    level: Int as uint8;
    paymentPeriod: Int as uint64;
    paymentAmount: Int as coins;
}
struct UserSubscriptionsData{
    //how much subscriptions this user has
    toMeCount: Int as uint32 = 0;
    //how much subscriptions this user gave to other users (subscribed to them)
    fromMeCount: Int as uint32 = 0;

    levels: map<Int as uint8, SubscriptionData>;
}

struct UserData{
    master: Address;
    userId: Int as uint64;
    owner: Address;
    blocked: Bool;
    postsCount: Int as uint64;
    likesCount: Int ;
    receivedAchievements: Int;
    subscriptionsData: UserSubscriptionsData;
    nickname: String?;
    avatar: String?;
}
const NullAddress: Address = address("UQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJKZ");

contract TactBug with Deployable {

    nickname: String? = null;
    avatar: String? = null;
    //variables from traits
    blocked: Bool = false;
    master: Address = address("UQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJKZ");

    postsCount: Int as uint64 = 0;
    likesCount: Int as uint64 = 0;
    commentsCount: Int as uint64 = 0;
    registerDate: Int as uint64 = 0;
    receivedAchievements: Int as uint256 = 0x0;
    achievementMinterAddress: Address = address("UQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJKZ");
    profitAddress: Address =address("UQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJKZ");
    //user owner address
    owner: Address = address("UQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJKZ");
    //user id
    userId: Int as uint64 = 0;
    subscriptionsData: UserSubscriptionsData= UserSubscriptionsData{ fromMeCount: 0, toMeCount: 0, levels: emptyMap()};
    blockedDNS: Bool = false;
    nicknameCollection: Address? = null;

    init(){

    }
    get fun data(): UserData{
        return UserData {
        master: NullAddress,
        userId: 0,
        owner: NullAddress,
        blocked: false,
        postsCount: 0,
        likesCount: 0,
        receivedAchievements: 123,
        subscriptionsData: self.subscriptionsData,
        nickname: self.nickname,
        avatar: "some random string, which for some reasons is always null"
        };
    }
}
