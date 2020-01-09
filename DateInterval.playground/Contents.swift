//: # DateInterval
import Foundation

//: ## Creation
let today = Date()
let tomorrow = Date(timeIntervalSinceNow: 60*60*24)

let next24Hours = DateInterval(start: today, end: tomorrow)


//: ## DateIntervalFormatter

let formatter = DateIntervalFormatter()
formatter.locale = Locale(identifier: "en-US")
formatter.dateStyle = .full
formatter.timeStyle = .full

formatter.string(from: next24Hours)
formatter.string(from: today, to: tomorrow)


//: ## Inclusion
let myHoliday = DateInterval(start: Date(), duration: 60*60*24*14)

myHoliday.contains(Date(timeIntervalSinceNow: 60*60*24*3))


//: ## Comparison
next24Hours < myHoliday

//: ## Intersection
var components = Calendar.current.dateComponents([.year, .weekOfYear], from: Date())

components.weekday = 2
components.hour = 8
let firstDayOfWeek = Calendar.current.date(from: components)!

components.weekday = 6
components.hour = 17
let lastDayOfWeek = Calendar.current.date(from: components)!

let workWeek = DateInterval(start: firstDayOfWeek, end: lastDayOfWeek)

formatter.locale = Locale(identifier: "en_NZ")
formatter.string(from: workWeek)

myHoliday.intersects(workWeek)
formatter.string(from: myHoliday.intersection(with: workWeek)!)




