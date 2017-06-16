//: Playground - noun: a place where people can play

import UIKit
// sets
var jobs=Set<String>()
jobs.insert("Developer")
jobs.insert("tester")
jobs.insert("manager")
jobs.insert("admin")
jobs.insert("admin")
for job in jobs {
     print ("jobsSet:\(job)")
}


//array
var jobsArray=Array<String>()
jobsArray.append("Developer")
jobsArray.append("tester")
jobsArray.append("manager")
jobsArray.append("admin")
jobsArray.append("admin")
for job in jobsArray {
    print ("jobsArray:\(job)")
}
