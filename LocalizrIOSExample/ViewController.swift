//
//  ViewController.swift
//  LocalizrIOSExample
//
//  Created by Michael Pantaleon on 2017/11/26.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

extension String {
  
  var localized: String {
    
    let localeCode = UserDefaults.standard.string(forKey: AppSettingKey.localeKey.rawValue)
    var s = ""
    if let path = Bundle.main.path(forResource: localeCode, ofType: "lproj") {
      if let bundle = Bundle(path: path) {
        s =  NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
      }
    } else {
      s = NSLocalizedString(self, comment: "")
    }
    return s
  }
}
import UIKit

class ViewController: UITableViewController {
  
  let keys = [
    "ALWAYS",
    "BACK",
    "CANCEL",
    "DONE",
    "DOWN",
    "FORWARD",
    "GOOD_AFTERNOON",
    "GOOD_BYE",
    "GOOD_LUCK",
    "GOOD_MORNING",
    "GOOD_NIGHT",
    "GREAT",
    "GREETING",
    "GTG",
    "HELLO",
    "HOME",
    "HOW_ARE_YOU",
    "I_HATE_YOU",
    "I_LOVE_YOU",
    "I_MISS_YOU",
    "INFO",
    "LEFT",
    "NAME",
    "NICE_TRY",
    "OK",
    "OMG",
    "RIGHT",
    "SAVE",
    "SEE_YOU",
    "SUCCESSFUL",
    "TAKE_CARE",
    "UP",
    "WARNING"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return keys.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let localeCell = tableView.dequeueReusableCell(withIdentifier: "locale_cell")!
    localeCell.textLabel?.text = keys[indexPath.row]
    localeCell.detailTextLabel?.text = keys[indexPath.row].localized
    return localeCell
  }
  
  func updateAppLocale(_ locale:String) {
    UserDefaults.standard.set(locale, forKey: AppSettingKey.localeKey.rawValue)
  }
  
  @IBAction func changeLocale(_ sender: Any) {
    let localeSelector = UIAlertController(title: "Select a Language", message: nil, preferredStyle: .actionSheet)
    
    localeSelector.addAction(UIAlertAction(title: "English", style: .default, handler: { (action) in
      self.updateAppLocale("en")
      self.tableView.reloadData()
    }))
    
    localeSelector.addAction(UIAlertAction(title: "Japanese", style: .default, handler: { (action) in
      self.updateAppLocale("ja")
      self.tableView.reloadData()
    }))
    
    localeSelector.addAction(UIAlertAction(title: "Chinese", style: .default, handler: { (action) in
      self.updateAppLocale("zh")
      self.tableView.reloadData()
    }))
    
    localeSelector.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action) in
      
    }))
    
    present(localeSelector, animated: true) {
      
    }
  }
}
