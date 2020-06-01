//
//  ViewController.swift
//  Homework31
//
//  Created by Kato on 6/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sandro: Person?
        var developer: Job?
        
        sandro = Person()
        developer = Job()
        
        sandro?.job = developer
        developer?.person = sandro
        
        sandro = nil
        developer = nil
    }

}

// weak-ის დამატებამდე person და job ობიექტები default-ად იყვნენ strong ტიპის,
// რის გამოც მათ შორის წარმოიქმნა retain cycle, ანუ strong reference cycle.
// ამის გამო, როდესაც რომელიმეს გავუტოლებდით ნილს, ის არ იშლებოდა მეხსიერებიდან,
// რადგან მეორეს ჰქონდა მასთან strong reference და ამიტომ arc არ ახდენდა მის დეალოკაციას.
// job-ის weak-ად გადაყვანის შემდეგ კი პრობლემა იხსნება, რადგან როდესაც person-ის ინსტანსს
// ნილს გავუტოლებთ, job-ს აღარ ექნება მასთან strong კავშირი და იგი ამოიშლება მეხსიერებიდან.


class Job {
    
    // var person -> weak var person
    weak var person: Person?
    
    deinit {
       print("Deallocating job")
    }
}

class Person {
    var job: Job?
    
    deinit {
        print("Deallocating person")
    }
}

