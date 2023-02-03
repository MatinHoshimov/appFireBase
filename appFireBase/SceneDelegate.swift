//
//  SceneDelegate.swift
//  appFireBase
//
//  Created by Matin Hoshimov on 01.02.2023.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        
//        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//            
//            FirebaseApp.configure()
//            Auth.auth().addStateDidChangeListener { (auth, user) in //авторизован ли пользователь или нет
//                if user == nil{
//                    print("hello")
//                    self.showModalAuth()
//                }
//                
//            }
//            return true
//        }
        
        func showModalAuth(){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newvc = storyboard.instantiateViewController(withIdentifier:  "authViewController") as! AuthViewController

            self.window?.rootViewController = UINavigationController(rootViewController: newvc)
            
            print("hello world")
        }

    

        let controller = UIViewController()
        //controller.view.backgroundColor = .red
      //  self.window?.rootViewController?.present(controller, animated: true)
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        let windowScene = UIWindow(windowScene: sceneWindow)
        windowScene.rootViewController = UINavigationController(rootViewController: controller)
        //windowScene.rootViewController
        self.window = windowScene
        windowScene.makeKeyAndVisible()
        showModalAuth()
    }
    func showModalAuth(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newvc = storyboard.instantiateViewController(withIdentifier:  "authViewController") as! AuthViewController

        self.window?.rootViewController?.present(newvc, animated: true, completion: nil)
        
        print("hello world")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

