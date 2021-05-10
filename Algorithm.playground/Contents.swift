import SwiftUI
import Foundation


var catalogueArray: [Catalogue] = []
var courseArray : [Course] = []
var studentArray : [Student] = []


struct Student : Identifiable {
    var id : Int
    var StudentName : String
    var Primary : Catalogue //mke minor
    var Secondary: Catalogue
    var CurrentCourses : [Course]
    
    mutating func addTask(course: Course){
        CurrentCourses.append(course)
    }
    
}

struct Course {
    var Name : String
    var Description : String
    var Credit : Double
    var AntiRequisites : [String]?
    var PreRequisites : [Course]?
};


struct Catalogue {
    var Department : String //figure out specific
    var MajorSpecMin : String
    var Degree : String
    var TotalCreditCount : Double
    var RequiredCourses: [String]
    var RequiredCourseDescription : String
}


var cs2214 = Course(Name: "CS2214", Description: "Second Year CS Course", Credit: 0.5, AntiRequisites: [], PreRequisites: [])
var cs1027 = Course(Name: "CS1027", Description: "First Year CS Course", Credit: 0.5, AntiRequisites: [], PreRequisites: [])
var cs1000 = Course(Name: "CS1000", Description: "Testing", Credit: 0.5, AntiRequisites: ["CS2214"], PreRequisites: [])
var es1078 = Course(Name: "ES1078", Description: "Testing2", Credit: 1.0, AntiRequisites: ["CS1000"], PreRequisites: [])



var catalogueOne = Catalogue(Department: "Department of Science", MajorSpecMin: "Major", Degree: "CS", TotalCreditCount: 6.0, RequiredCourses: ["CS2214", "CS1027", "CS1000"], RequiredCourseDescription: "You need 3.0 courses in")
var catalogueTwo = Catalogue(Department: "Department of History", MajorSpecMin: "Minor", Degree: "World History", TotalCreditCount: 2.0, RequiredCourses: ["HIST1023", "HIST9012", "PHIL1000"], RequiredCourseDescription: "You need 2.0 courses in")




var studentOne = Student(id: 251035776, StudentName: "Adam Salaymeh", Primary: catalogueOne, Secondary: catalogueTwo, CurrentCourses: [])

courseArray.append(cs2214)
courseArray.append(cs1027)
courseArray.append(cs1000)
courseArray.append(es1078)
catalogueArray.append(catalogueOne)
studentArray.append(studentOne)


//this pulls out entry of array that matches ID
//we can probably use the same logic to pull out the specific catalogue entry needed to compare
var index1 : Int = studentArray.firstIndex(where: {$0.id == 251035776})!
var indexCat : Int = catalogueArray.firstIndex(where: {$0.Degree == "CS" && $0.MajorSpecMin == "Major"})!
print(indexCat)

//this pulls the required courses and adds them to current courses
//we may not need this
for item in studentArray[index1].Primary.RequiredCourses {
    let name = item
    let index = courseArray.firstIndex(where: {$0.Name == name})!
    studentArray[index1].addTask(course: courseArray[index])
}


//finds antirequisites which are in course array, based on courses you are current taking

for i in 0 ..< courseArray.count{
    for item in studentArray[index1].CurrentCourses {
        for _ in courseArray {
            if courseArray[i].AntiRequisites!.contains(where: {$0 == item.Name}) {
                print(item)
            }
            break
        }
    }
}


var currentCount = 0.0
for item in studentArray[index1].CurrentCourses {
    currentCount += item.Credit
}
print("\(currentCount) / \(catalogueArray[indexCat].TotalCreditCount)")
