// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
public class FDFoundation : NSObject {
    //class func
    public class func getVersion() -> String {
        return "1.0"
    }
    
    public class func getBuildVersion() -> String {
        return "20220411"
    }
}

public extension String{
    public func base64Decode() -> String{
        var data = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        var string = NSString(data: data as! Data, encoding: String.Encoding.utf8.rawValue) as! String
        return string
    }
    
    public func base64Encode() -> String{
        var data = self.data(using: .utf8)
        var base64String = data?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64String!
    }
}

public extension Date{
    /// 转换成几分钟前，几小时前，几天前
    func toCurrentTime() -> String {
        //获取当前的时间戳
        let currentTime = Date().timeIntervalSince1970
        //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
        let timeStamp = self.timeIntervalSince1970
        //时间差
        let reduceTime : TimeInterval = currentTime - timeStamp
        //时间差小于60秒
        if reduceTime < 60 {
            return "刚刚"
        }
        //时间差大于一分钟小于60分钟内
        let mins = Int(reduceTime / 60)
        if mins < 60 {
            return "\(mins)分钟前"
        }
        let hours = Int(reduceTime / 3600)
        if hours < 24 {
            return "\(hours)小时前"
        }
        let days = Int(reduceTime / 3600 / 24)
        if days < 30 {
            return "\(days)天前"
        }
        //不满足上述条件---或者是未来日期-----直接返回日期
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="yyyy-MM-dd"
        return dfmatter.string(from: self)
    }
}
