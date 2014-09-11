class TodosController < UIViewController
  attr_writer :data

  def ViewDidLoad
    super
    self.title = 'Okonawa'
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.dataSource = self
    self.view.addSubview(@table)

    @data = %w(Milk Orange\ Juice Apples Bananas Broccoli Carrots Beef Chicken Enchiladas Hot\ Dogs Butter Bread Pasta Rice)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @data.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:nil)
    cell.textLabel.text = @data[indexPath.row]
    cell
  end
end