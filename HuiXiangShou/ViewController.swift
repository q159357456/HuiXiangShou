//
//  ViewController.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/23.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
struct Music {
    let name: String
    let singer: String
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}
extension Music: CustomStringConvertible{
    var description: String {
        return "name：\(name) singer：\(singer)"
    }
    
    
}
//struct MusicListViewModel {
//    let data = [
//         Music(name: "无条件", singer: "陈奕迅"),
//         Music(name: "陈奕迅", singer: "S.H.E"),
//         Music(name: "从前的我", singer: "陈洁仪"),
//         Music(name: "在木星", singer: "朴树")
//    ]
//
//}
struct MusicListViewModel {
    let data = Observable.just([
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
    ])
    
}
class ViewController: UIViewController {
    fileprivate lazy var bag = DisposeBag()
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        return tableView
    }()
    let model = MusicListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let button: UIButton = UIButton.init(type: .custom)
//        button.addTarget(self, action: #selector(btn1Click(btn:)), for: .touchUpInside)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        self.view.addSubview(button)
        button.rx.tap.subscribe { (event) in
            print(event)
        }.disposed(by: bag)
//        self.view.addSubview(tableView)
        
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.center = CGPoint(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT/2+80)
        
        self.view.addSubview(label)
//
//        let observable = Observable<String>.create{observer in
//            //对订阅者发出了.next事件，且携带了一个数据"hangge.com"
//            observer.onNext("hangge.com")
//            //对订阅者发出了.completed事件
//            observer.onCompleted()
//            //因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要returen一个Disposable
//            return Disposables.create()
//        }
//        let observable = Observable.of("A", "B", "C")
//        let sub = observable.subscribe { (event) in
//            print(event)
//        }
//        sub.dispose()
//        let observer: Binder<String> = Binder(label) { view, text in
//
//            view.text = text
//
//        }
    
        label.text = "666"
        
        let observable = Observable<Int>.interval(1, scheduler: MainScheduler.asyncInstance)

        observable.map{"这是索引：\($0)"}.bind(to: label.rx.text).disposed(by: bag)
        
        
     
        
        //
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(UITableViewCell.classForCoder()))
        model.data.bind(to: tableView.rx.items(cellIdentifier: NSStringFromClass(UITableViewCell.classForCoder()))){
            _, music, cell in
            cell.textLabel?.text = music.name

        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { (music) in
            print(music.name)
            
    
        }).disposed(by: bag)
     
      
        // Do any additional setup after loading the view.
    }

    @objc func btn1Click(btn: UIButton) -> Void {
        print("shishikan")
       
    }
    
    func showmessage(text: String) -> Void {
        
    }
    
   
    
   
   
}
//extension ViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return model.data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.classForCoder()))!
//        let music: Music = model.data[indexPath.row]
//        cell.textLabel?.text = music.name
//        return cell
//
//    }
//
//
//}
//
//extension ViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//          print("do somthing")
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 45
//    }
//
//}
