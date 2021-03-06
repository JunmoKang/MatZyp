//
//  SettingController.swift
//  MatZyp
//
//  Created by hyu on 2016. 11. 12..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//
/*
 setting calss를 따로 두고 tab bar controller 로 설정에 들어가 언어 변경하는 기능을 만들고 싶었지만
 언어 변경을 한 후에 동기화가 되지 않는 문제가 발생(tab 끼리 data를 refresh하는 방법을 찾지못함)
 따라서 일단 보관용으로 넣어둠. 추후에 방법을 찾으면 활용할 예정
*/


import UIKit

class SettingController: UITableViewController {
    
    @IBOutlet weak var check1: UISwitch!
    @IBOutlet weak var check2: UISwitch!
    @IBOutlet weak var check3: UISwitch!
    var lang : Language = dataCenter.setting.getLanguage()
    var lang_String: String = ""

   
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var changeButtonLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    //언어 변경할때 마다 그에 맞는 버튼 title 바꿔주기
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        
        check1.isOn = false
        check2.isOn = false
        check3.isOn = false
        if(lang == .korean){
            check1.isOn = true
            lang_String = "한국어"
            self.title = "설정"
            accountLabel.text = "계정"
            changeButtonLabel.text = "언어 변경하기"
        }
        else if (lang == .english){
            check2.isOn = true
            lang_String = "영어"
            self.title = "Setting"
            accountLabel.text = "Account"
            changeButtonLabel.text = "Change Language"
        }
        else {
            check3.isOn = true
            lang_String = "중국어"
            self.title = "汉语"
            accountLabel.text = "計定"
            changeButtonLabel.text = "语言的变更"
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */
    
    @IBAction func changeCheck1(_ sender: Any) {
   // }
   // @IBAction func changeCheck1(_ sender: Any) {
        if(check1.isOn) {
            check2.isOn = false
            check3.isOn = false
            lang = .korean
            lang_String = "한국어"
           // self.title = "설정"
        }
    }
    @IBAction func changeCheck2(_ sender: Any) {
    //}
    //@IBAction func changeCheck2(_ sender: Any) {
        if(check2.isOn){
            check1.isOn = false
            check3.isOn = false
            lang = .english
            lang_String = "영어"
            //self.title = "Setting"
        }
    }
    @IBAction func changeCheck3(_ sender: Any) {
        if(check3.isOn){
            check1.isOn = false
            check2.isOn = false
            lang = .chinese
            lang_String = "중국어"
            //self.title = "設定"
        }
    }
    @IBAction func changeLanguage(_ sender: Any) {
        dataCenter.setting.setLanguage(set_lang: lang)
        //self.tableView.reloadData()
        //super.tableView.reloadData()
        super.viewWillAppear(true)
        tableView.reloadData()
        print("hi")
        let alert:UIAlertController
        if(lang == .korean)
        {
            alert = UIAlertController(title: "언어 변경", message: "\(lang_String)로 변경합니다.", preferredStyle: .alert)
        }else if(lang == .english){
            alert = UIAlertController(title: "Language Change", message: "Change in English.", preferredStyle: .alert)
        }else{
            alert = UIAlertController(title: "语言的变更", message: "改变中国.", preferredStyle: .alert)
            
        }
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
            
        }
        
        if (lang == .korean) {
            self.title = "설정"
            self.tabBarController?.tabBar.items?[0].title = "지역"
            self.tabBarController?.tabBar.items?[1].title = "지도"
            accountLabel.text = "계정"
            changeButtonLabel.text = "언어 변경하기"
        } else if (lang == .english) {
            self.title = "Setting"
            self.tabBarController?.tabBar.items?[0].title = "Location"
            self.tabBarController?.tabBar.items?[1].title = "Map"
            accountLabel.text = "Account"
            changeButtonLabel.text = "Change Language"
        } else if (lang == .chinese) {
            self.title = "設定"
            self.tabBarController?.tabBar.items?[0].title = "地域"
            self.tabBarController?.tabBar.items?[1].title = "地图"
            accountLabel.text = "計定"
            changeButtonLabel.text = "语言的变更"
        }
        //to-do 
        //언어 변경할 때 그 글자들 다 번역되게 해놓기
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
