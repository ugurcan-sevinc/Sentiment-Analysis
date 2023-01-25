import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,didSendTupleDelegate  {
   
    let service = Service()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    let defaults = UserDefaults.standard
    var comment: Comment?
    var array: [Comment] = []
    var emptyArray: [Comment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        imageView.layer.cornerRadius = 10
        if let fetchedData = UserDefaults.standard.data(forKey: "comments") {
            array = try! PropertyListDecoder().decode([Comment].self, from: fetchedData)
            print(array)
        }
        else {
            self.array = []
        }
    }
    func didSend(comment: Comment) {
        
        self.comment = comment
        service.getResult(message: comment.title + " " + comment.description) { response in
            if let data = response.data {
                self.comment!.result = data
            }
            self.array.append(self.comment!)
            let encodedData = try! PropertyListEncoder().encode(self.array)
            self.defaults.set(encodedData, forKey: "comments")
            self.tableView.reloadData()
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        if indexPath.row < array.count {
            let comment = array[indexPath.row]
            cell.titleLabel.text = array[indexPath.row].title
            cell.descriptionLabel.text = array[indexPath.row].description
            if comment.result == true {
                cell.superContainerView.backgroundColor = .green
            }
            else {
                cell.superContainerView.backgroundColor = .red
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    @IBAction func addCommentClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ModalViewController {
            destination.delegate = self
        }
    }
}
