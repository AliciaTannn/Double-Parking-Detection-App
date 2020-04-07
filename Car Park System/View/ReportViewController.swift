//
//  ReportViewController.swift
//  Car Park System
//
//  Created by Alicia Tan on 02/02/2020.
//  Copyright © 2020 CarPark. All rights reserved.
//

import UIKit
//Import Chart library to display chart
import Charts

class ReportViewController: UIViewController {
    
    @IBOutlet weak var chartView: PieChartView!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        //Display the chart
        customizeChart(dataPoints: status, values: number.map{ Double($0) })
      }
      
      func customizeChart(dataPoints: [String], values: [Double]) {
        
        // 1. Set ChartDataEntry
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data:  dataPoints[i] as AnyObject)
          dataEntries.append(dataEntry)
        }
        
        // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        // 4. Assign it to the chart's data
        chartView.data = pieChartData
      }
      
        //Assign colours to the chart
      private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
          let red = Double(arc4random_uniform(256))
          let green = Double(arc4random_uniform(256))
          let blue = Double(arc4random_uniform(256))
          let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
          colors.append(color)
        }
        return colors
      }
    }
