//
//  StudentsTableViewController.swift
//  C4QStudentBook
//
//  Created by Victor Zhong on 9/30/16.
//  Copyright © 2016 Victor Zhong. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
	var students = [Student]()
	var currentStudent: Student!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = currentStudent.info.firstName + " " + currentStudent.info.lastName
		
		/*
		"info": [
		"fullName": "Jason Wang",
		"email":"qwang216@gmail.com",
		"imageName": "jason",
		],
		"studentID": 3200,
		"github": "qwang216",
		"linkedin": "jasonqwang",
		"funFact": "I code for food"
		*/
		
		for studentDict in ac32_students {
			let student = Student(studentDict: studentDict)
			students.append(student)
		}
	}	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return self.students.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "studentTVCID", for: indexPath) as! StudentTableViewCell
		
		
		// Configure the cell...
		
		let student = students[indexPath.row]
		//		let studentInfo = student.info
		//		cell.imageView?.image = UIImage(named: student.info.imageName)
		//		cell.nameLabel.text = studentInfo.firstName + " " + studentInfo.lastName
		//		cell.emailLabel.text = studentInfo.email
		cell.setData(student: student)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedStudent = self.students[indexPath.row]
		performSegue(withIdentifier: "studentDetailSegueID", sender: selectedStudent)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "studentDetailSegueID"{
			// perform segue on Detail View Controller
			let detailController = segue.destination as! DetailViewController
			let selectedStudent = sender as? Student
			detailController.student = selectedStudent
			// The below affects the title of the back button in the next view controller
			let backItem = UIBarButtonItem()
			backItem.title = "Students"
			navigationItem.backBarButtonItem = backItem
		}
	}
}
