class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    seed unless RUBYMOTION_ENV == 'test'

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @todos_controller = TodosController.alloc
                        .initWithNibName(nil, bundle:nil)

    @window.rootViewController =
      UINavigationController.alloc
        .initWithRootViewController(@todos_controller)

    @window.makeKeyAndVisible

    true
  end

  def seed
    now = NSDate.new
    things = %w(Milk Orange\ Juice Apples Bananas Broccoli Carrots Beef
                Chicken Enchiladas Hot\ Dogs Butter Bread Pasta Rice)
    things.each do |thing|
      Todo.create :name => "Buy #{thing}",
                  :description => "We need some #{thing}",
                  :due_date => now
    end
  end
end
