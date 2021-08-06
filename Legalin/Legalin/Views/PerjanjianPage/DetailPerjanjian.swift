//
//  DetailPerjanjian.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 05/08/21.
//
import Foundation
import UIKit
import SwiftUI

struct DetailPerjanjian: View {
    
    @State var currentPageindex = 0
    
    
    var body: some View {
        NavigationView{
            PageView(indexDisplayMode: .automatic, indexBackgroundDisplayMode: .always){
                PdfAction()
                Pihak1()
                Pihak2()
                InfoPinjaman()
                InfoAgunan()
            }
//            ContainerView(["title 1", "title 2", "title 3"])
                .navigationBarTitle("Detail Perjanjian", displayMode: .inline)
            .navigationBarItems(trailing:
                                    HStack(spacing: 16){
                                        Button(action: {
                                            
                                        }){
                                            Image(systemName: "square.and.pencil")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                        }
                                        Button(action: {
                                            
                                        }){
                                            Image(systemName: "trash")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                        }
                                    }
            )
        }
    }
}
extension UINavigationController{
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        
        navigationBar.standardAppearance = appearance
    }
}

struct DetailPerjanjian_Previews: PreviewProvider {
    static var previews: some View {
        DetailPerjanjian()
    }
}

//struct TitlePage: View{
//
//    var title: String
//
//    var body: some View{
//        Text(title)
//    }
//}
//
//struct ContainerView: View{
//
//    var controllers: [UIHostingController<TitlePage>]
//    init(_ titles: [String]) {
//        self.controllers = titles.map{
//            UIHostingController(rootView: TitlePage(title: $0))
//        }
//    }
//
//    var body: some View{
//        PageViewController(controllers: self.controllers)
//    }
//}
//
//struct PageViewController: UIViewControllerRepresentable{
//
//    var controllers: [UIViewController]
//
//    func makeUIViewController(context: Context) -> UIPageViewController {
//        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
//        pageViewController.dataSource = context.coordinator
//
//
//        return pageViewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
//        uiViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    typealias UIViewControllerType = UIPageViewController
//
//    class Coordinator: NSObject, UIPageViewControllerDataSource{
//        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//            guard let index = self.parent.controllers.firstIndex(of: viewController)else{
//                return nil
//            }
//            if index == 0{
//                return self.parent.controllers.last
//            }
//
//            return self.parent.controllers[index - 1]
//        }
//
//        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//            guard let index = self.parent.controllers.firstIndex(of: viewController)else{
//                return nil
//            }
//            if index == self.parent.controllers.count - 1{
//                return self.parent.controllers.first
//            }
//            return self.parent.controllers[index + 1]
//        }
//
//        let parent: PageViewController
//
//        init(_ parent: PageViewController){
//            self.parent = parent
//        }
//    }
//
//
//}
