# Notes:
# This (app_delegate.rb) is the entry point for ever iOS application. Take a look at the
# following link for all the of the callback functions that `UIApplicationDelegate` supports
# https://developer.apple.com/documentation/uikit/uiapplicationdelegate?language=objc
#
# Once you've read all the comments in this file. Head over to `beer_map_controller.rb`.
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # This is standard boiler plate. Every application needs its @window set to a specific size.
    # In this case, we are setting the size to fill the entire screen.
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # The UITabBarController is a component that ships with UIKit (Apple's graphic interface suite).
    tabbar = UITabBarController.alloc.init

    # After creating the tab bar. Create two tabs. The first tab will serve up a map. The second tab
    # will present a list/table.
    tabbar.viewControllers = [BeerMapController.alloc.init, BeerListController.alloc.init]

    # Set the tab for the tab view controller to be the first tab.
    tabbar.selectedIndex = 0

    # Generally speaking, all applications wrap themselves in a UINavigationController (another
    # component that ships with UIKit). # The navigation controller is responsible for pushing
    # and popping views off of the ui stack and manages the back button and gestures you see in
    # many iOS applications.

    # This line initializes a UINavigationController, with the container being the UITabBarController.
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)

    # Here is the UI hierarchy for this application. Generally speaking, it's strongly recommended that you
    # always make a UINavigationController as your top level controller. The TabController is also important
    # (but optional to have in your UI Hiearchy). Many applications (such as Instagram, Tweetbot, Reddit)
    # use this control. There are apps that do not use a UITabBarController (such as Slack, Mail, Settings).
    # however,

    # For this app, this is the controll layout
    # - UINavigationController
    #   - UITabBarController
    #     - BeerMapController -> reuses and presets BeerDetailsController my pushing it onto the UINavigationController stack
    #     - BeerListController -> reuses and presets BeerDetailsController my pushing it onto the UINavigationController stack
    @window.makeKeyAndVisible

    true
  end

  # This property will be used later in our application.
  # From a memory standpoint. It's generally recommend to reuse views
  # (and update the internal controls) as opposed to initializing a new view.
  def beer_details_controller
    @beer_details_controller ||= BeerDetailsController.alloc.init
  end
end
