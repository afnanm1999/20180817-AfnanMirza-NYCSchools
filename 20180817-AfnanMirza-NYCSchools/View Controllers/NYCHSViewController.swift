//
//  NYCHSViewController.swift
//  20180817-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 8/17/18.
//  Copyright © 2018 Afnan Mirza. All rights reserved.
//

import UIKit

class NYCHSViewController: UIViewController {
    // UI Components
    
    @IBOutlet var reloadBtn: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    // Variables
    var nycHSList: [NYCHighSchools]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.global(qos: .userInitiated).async {
            self.fetchNYCHighSchoolInformation()
        }
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        print("Reloading...")
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.fetchNYCHighSchoolInformation()
        }
        
    }
    
    //MARK: - Fetch API and parse JSON payloads
    private func fetchNYCHighSchoolInformation(){
        guard let highSchoolsURL = URL(string: Constants.highSchoolsURL) else {
            return
        }
        
        let request = URLRequest(url:highSchoolsURL)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { [weak self] (highSchoolsData, response, error)  in
            if highSchoolsData != nil{
                do{
                    let highSchoolsObject = try JSONSerialization.jsonObject(with: highSchoolsData!, options: [])
                    self?.nycHSList = Utils.fetchNYCHsWithJsonData(highSchoolsObject)
                    self?.fetchHighSchoolSATSore()
                }catch{
                    print("NYC HS JSON error: \(error.localizedDescription)")
                }
            }
            
        }
        task.resume()
    }
    
    
    /// This function is will call the API to get all of the High School with SAT Score, and add to the exist model array according to the common parameter DBN.
    private func fetchHighSchoolSATSore(){
        guard let highSchoolsSATScoreURL = URL(string: Constants.schoolWithSATScoreURL) else {
            return
        }
        let requestForSATScore = URLRequest(url:highSchoolsSATScoreURL)
        let session = URLSession.shared
        let task = session.dataTask(with: requestForSATScore) {[weak self] (schoolsWithSATScoreData, response, error) in
            if schoolsWithSATScoreData != nil{
                do{
                    let satScoreObject = try JSONSerialization.jsonObject(with: schoolsWithSATScoreData!, options: [])
                    self?.addSatScoreToHighSchool(satScoreObject)
                    DispatchQueue.main.async {[weak self] in
                        self?.tableView.reloadData()
                    }
                }catch{
                    debugPrint("high school with sat score json error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    
    /// This function is used to add the sat score to the high school
    ///
    /// - Parameter satScoreObject: Data of Array composed with Dictionary
    private func addSatScoreToHighSchool(_ satScoreObject: Any){
        guard let highSchoolsWithSatScoreArr = satScoreObject as? [[String: Any]] else{
            return
        }
        
        for  highSchoolsWithSatScore in highSchoolsWithSatScoreArr{
            if let matchedDBN = highSchoolsWithSatScore["dbn"] as? String{
                //This will get the High School with the Common DBN
                let matchedHighSchools = self.nycHSList?.first(where: { (nycHighSchool) -> Bool in
                    return nycHighSchool.dbn == matchedDBN
                })
                
                guard matchedHighSchools != nil else{
                    continue
                }
                
                if let satReadingScoreObject =  highSchoolsWithSatScore["sat_critical_reading_avg_score"] as? String{
                    matchedHighSchools!.satCriticalReadingAvgScore = satReadingScoreObject
                }
                
                if let satMathScoreObject = highSchoolsWithSatScore["sat_math_avg_score"] as? String{
                    matchedHighSchools!.satMathAvgScore = satMathScoreObject
                }
                
                if let satWritingScoreObject =  highSchoolsWithSatScore["sat_writing_avg_score"] as? String{
                    matchedHighSchools!.satWritinAvgScore = satWritingScoreObject
                }
                
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Pass the selected school with sat score to the destinatiion view controller
        if segue.identifier == Constants.HSWithSATScoreSegue{
            let highSchoolWithSATScoreVC = segue.destination as! NYCHSDetailTableViewController
            if let highSchoolWithSATScore = sender as? NYCHighSchools {
                highSchoolWithSATScoreVC.HSWithSatScore = highSchoolWithSATScore
            }
        }
    }
    
    
}


// MARK: UITableViewDataSource and UITableViewDelegate Extensions
extension NYCHSViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        CellAnimator.animate(cell, withDuration: 0.6, animation: CellAnimator.AnimationType(rawValue: 5)!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nycHSList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: Constants.hsCellIdentifier, for: indexPath)

        
        if let nycHighSchoolsArr = self.nycHSList{
            cell.textLabel?.text = nycHighSchoolsArr[indexPath.row].schoolName
            
            if let phoneNum = nycHighSchoolsArr[indexPath.row].schoolTelephoneNumber{
                cell.detailTextLabel?.text = "Phone # \(phoneNum)"
            }
            
        }
        
        return cell
    }
    
    //MARK: - UITable View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nycHighSchoolsArray = self.nycHSList{
            let selectedHighSchool = nycHighSchoolsArray[indexPath.row]
            self.performSegue(withIdentifier: Constants.HSWithSATScoreSegue, sender: selectedHighSchool)
        }
    }
}
