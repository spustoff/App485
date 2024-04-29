//
//  GoalsViewModel.swift
//  App485
//
//  Created by IGOR on 22/04/2024.
//

import SwiftUI
import CoreData

final class GoalsViewModel: ObservableObject {

    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "EUR/JPY", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currentCurrency = ""
    @AppStorage("pair") var pair = ""
    
    @AppStorage("summ") var summ: Int = 0

    @Published var isAddGoal: Bool = false
    @Published var isAddHistory: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDeleteHistory: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDetailHistory: Bool = false
    @Published var isEditBalance: Bool = false
    
    @Published var isGraphic: Bool = false
    @Published var isCurrencies: Bool = false

    @Published var categories: [String] = ["Courses", "Books", "Other"]
    @Published var currentCategory = "Courses"
    @Published var currentCategoryForAdd = ""

    @Published var goalCategory = ""
    @Published var goalName = ""
    @Published var goalBudget = ""

    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?

    func addGoal() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel

        loan.goalCategory = goalCategory
        loan.goalName = goalName
        loan.goalBudget = Int16(goalBudget) ?? 0

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGoals() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.goals = result.filter{($0.goalCategory ?? "") == currentCategory}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
    
    @Published var hisCategory = ""
    @Published var hisName = ""
    @Published var hisPayment = ""
    @Published var hisDate: Date = Date()

    @Published var histories: [HistoryModel] = []
    @Published var selectedHistory: HistoryModel?

    func addHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel

        loan.hisCategory = hisCategory
        loan.hisName = hisName
        loan.hisPayment = Int16(hisPayment) ?? 0
        loan.hisDate = hisDate

        CoreDataStack.shared.saveContext()
    }
    
    func fetchHistories() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.histories = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.histories = []
        }
    }
}
