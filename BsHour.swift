struct BsHour{
    var arrayOfArraysIsABadIdea:[[BsFormat]] = [[]]
    mutating func add(timeRangeBS:[BsFormat]) -> Bool {
        arrayOfArraysIsABadIdea.append(timeRangeBS)
        return true
    }
}

struct BsFormat{
    var a:Int
    var b:Int
    var c:Int
    var d:Int
    var e:Int
    var f:Int
    init(a:Int, b:Int, c:Int, d:Int, e:Int, f:Int) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
    }
}

class Time {
    var minFromZero:Int = 0
    
    init?(MinFormat min:Int){
        if min < 0 {
            return nil
        }
        self.minFromZero = min
    }
    
    init?(HourMinFormat hour:Int, min:Int) {
        if hour < 0 || hour > 23 || min < 0 || min > 60 {
            return nil
        }
        self.minFromZero = hour * 60 + min
    }
    
    func isBefore(next: Time)-> Bool{
        if self.minFromZero < next.minFromZero {
            return true
        }
        return false
    }
    
    func getHour() -> Int {
        return self.minFromZero / 60
    }
    
    func getMin() -> Int {
        return (self.minFromZero % 60)
    }
    
    func toCalendarFormat() -> BsFormat {
        //GregorianCalendar is NOT something in iOS
        return BsFormat(a: 1900, b: 1, c: 1, d: self.getHour(), e: self.getMin(), f: 0)
    }
    
    func timeRangeBsFormat(toTime next:Time) -> [BsFormat] {
        return [self.toCalendarFormat(), next.toCalendarFormat()]
    }
    
}

//AddBsHour
var bsHour = BsHour()
let fromTime:Time? = Time(MinFormat: 123)
let toTime:Time? = Time(MinFormat: 456)
let timeRangeBS = fromTime!.timeRangeBsFormat(toTime: toTime!)
bsHour.add(timeRangeBS: timeRangeBS)

