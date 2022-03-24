//
//  MainPageViewController.swift
//  DZ_16-17
//
//  Created by Vasily Bobkov  on 08.02.2022.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var pageArray = [Any]()
    
    let image1 = UIImage(named: "AS")
    let image2 = UIImage(systemName: "laptopcomputer.and.iphone")
    let image3 = UIImage(systemName: "person.crop.circle")
    let image4 = UIImage(systemName: "magnifyingglass")
    let image5 = UIImage(systemName: "bag")
    let image6 = UIImage(systemName: "app.badge")
    
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        let page1 = FirstPageElement(image1: image1!, mainLabel1: "Apple Store", descriptionLabel1: "Добро пожаловать!      Команда Apple благодарит вас, за ваш выбор.", fiLabel: "Для того чтобы пропустить вступление и начать работу нажмите на кнопку", siLabel: "Для того чтобы ознакомиться с приложением перелестните страницу")
        pageArray.append(page1)
        let page2 = PageElement(image: image2!, mainLabel: "Купить", descriptionLabel: "Во вкладке 'Купить' - вы сможете найти подходящий вам товар, а так же получить персональные предложения для ваших устройств")
        pageArray.append(page2)
        let page3 = PageElement(image: image3!, mainLabel: "Для вас", descriptionLabel: "Во вкладке 'Для вас' - вы сможете узнать где находится ваш заказ, а так же вам всегда будут доступны выгодные и персональные предложения")
        pageArray.append(page3)
        let page4 = PageElement(image: image4!, mainLabel: "Поиск", descriptionLabel: "Во вкладке 'Поиск' - вы сможете найти интиресующий вас товар")
        pageArray.append(page4)
        let page5 = PageElement(image: image5!, mainLabel: "Корзина", descriptionLabel: "Во вкладке 'Корзина' - будут отображаться выбранные вами для покупки категории товара")
        pageArray.append(page5)
        let page6 = LastPageElement(image: image6!, mainLabel: "Уведомления", descriptionLabel: "Включите 'Уведомления' и вы всегда сможете узнавать об уникальных предложениях", fiLabel: "Теперь вам доступно больше возможностей ", siLabel: "Нажмите на иконку 'настройки',       перейдите во вкладку 'Уведомления' и включите их")
        pageArray.append(page6)
        
    }
    
    //MARK: - Create pages
    

    
    lazy var arrayPageViewController: [UIViewController] = {
        var pages = [PageViewController]()
        for page in pageArray {
            if  page is PageElement {
            pages.append(PageViewController(pageWith: page as! PageElement))
            } else if page is FirstPageElement {
                pages.append(PageViewController(firstPageWith: page as! FirstPageElement))
            }else if page is LastPageElement {
                pages.append(PageViewController(LastPageWith: page as! LastPageElement))
            }
        }
        return pages
    }()

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.delegate = self
        self.dataSource = self
        
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = .lightGray
        appearance.currentPageIndicatorTintColor = .white
        
        self.view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        setViewControllers([arrayPageViewController[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = arrayPageViewController.firstIndex(of: viewController as! PageViewController){
            if index > 0 {
            return arrayPageViewController[index - 1]
          }
        }

        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = arrayPageViewController.firstIndex(of: viewController as! PageViewController){
            if index < pageArray.count - 1 {
            return arrayPageViewController[index + 1]
          }
            if index == pageArray.count - 1 {
            }
        }

        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
