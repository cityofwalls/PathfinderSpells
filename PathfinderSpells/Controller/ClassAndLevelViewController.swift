//
//  ClassAndLevelViewController.swift
//  PathfinderSpells
//
//  Created by Jesse Battalino on 12/12/17.
//  Copyright © 2017 Jesse Battalino. All rights reserved.
//

import UIKit

class ClassAndLevelViewController: UIViewController {
    
    var masterSpellList: [Spell]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSpellsFromJSON()
    }
    
    func loadSpellsFromJSON() {
        let spellURLString = "https://gist.githubusercontent.com/cityofwalls/0fdeb2da5d7b475968c8de88c75e77ad/raw/9e7de33b6f11e275ed244bff9b74394a01898b3d/PathfinderSpellsJSON.txt"
        
        guard let spellURL = URL(string: spellURLString) else {
            print("The string could not be converted into a URL...")
            return
        }
        
        let task = URLSession.shared.dataTask(with: spellURL, completionHandler: handleSpellLoad(data:response:error:))
        task.resume()
    }
    
    func handleSpellLoad(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil, let data = data else {
            print("No data or some other error occured...")
            return
        }
        
        let json = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
        
        for entry in json!! {
            let castingTime = entry["casting_time"] as? String
            let components = entry["components"] as? String
            let duration = entry["duration"] as? String
            let name = entry["name"] as? String
            let range = entry["range"] as? String
            let savingThrow = entry["saving_throw"] as? String
            let school = entry["school"] as? String
            let source = entry["source"] as? String
            let description = entry["description"] as? String
            let level = entry["level"] as? String
            let targets = entry["targets"] as? String
            
            let newSpell = Spell(castingTime: castingTime!, components: components!, duration: duration!,
                                 name: name!, range: range!, savingThrow: savingThrow!, school: school!,
                                 source: source!, description: description!, level: level!, targets: targets!)
            
            masterSpellList.append(newSpell)
        }
        // DEBUG:
        var spellCount = 1
        for spell in masterSpellList {
            print(spell.name)
            print(spell.level)
            print(spell.school)
            print("Spell #\(spellCount)")
            spellCount += 1
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
