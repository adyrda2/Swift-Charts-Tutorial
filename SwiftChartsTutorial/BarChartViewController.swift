import UIKit
import Charts

class BarChartViewController: UIViewController {
  @IBOutlet weak var barChartView: BarChartView!

  var months: [String]!
  var dataEntries: [BarChartDataEntry] = []

  override func viewDidLoad() {
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]

    customizeChart(dataPoints: months, values: unitsSold.map { Double($0) })
  }

  func customizeChart(dataPoints: [String], values: [Double]) {
    for i in 0..<dataPoints.count {
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
      dataEntries.append(dataEntry)
    }

    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Bar Chart View")
    let chartData = BarChartData(dataSet: chartDataSet)
    barChartView.data = chartData
  }
}
