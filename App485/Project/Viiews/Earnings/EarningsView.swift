//
//  EarningsView.swift
//  App485
//
//  Created by IGOR on 22/04/2024.
//

import SwiftUI

struct EarningsView: View {

    @StateObject var viewModel = EarningsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.currentCategory = index
                                viewModel.fetchGoals()
                                viewModel.fetchHistories()
                            }
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 38)
                                .background(RoundedRectangle(cornerRadius: 7).fill(.white.opacity(viewModel.currentCategory == index  ? 1 : 0)))
                        })
                    }
                }
                .padding(3)
                .background(RoundedRectangle(cornerRadius: 7).fill(.gray.opacity(0.4)))
                
                HStack {
                    
                    Text("$\(viewModel.summ)")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGoal = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                }
                .padding(.vertical, 8)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isCurrencies = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image("flags")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26)
                        
                        Spacer()
                        
                        Text(viewModel.pair.isEmpty ? "EUR/USD" : viewModel.pair)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .black.opacity(0.2), radius: 4))
                    .padding(3)
                })
                
                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddGoal = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text("$0")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .bold))
                                            
                                            Text("Add a goal")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .underline(true, color: .white)
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("$0")
                                                .foregroundColor(.white)
                                                .font(.system(size: 11, weight: .regular))
                                            
                                            Text("You need to save up")
                                                .foregroundColor(.white)
                                                .font(.system(size: 11, weight: .regular))
                                        }
                                        .padding(8)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                    }
                                    
                                    Text("Number of payments: \(viewModel.histories.count)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top, 7)
                                    
                                    HStack {
                                        
                                        Text("History")
                                            .foregroundColor(.white)
                                            .font(.system(size: 22, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isAddHistory = true
                                            }
                                            
                                            
                                        }, label: {
                                            
                                            Image(systemName: "plus")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .regular))
                                        })
                                    }
                                    .padding(.vertical, 7)
                                    
                                    VStack {
                                        
                                        Text("There are no records")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    .padding()
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.2), radius: 4))
                                    .padding(3)
                                }
                                .padding()
                                .frame(height: 280)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("p1")))
                            })
                        }
                        
                     Spacer()
                        
                    }
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.goals, id: \.self) { index in
                                                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading) {
                                                
                                                Text("$\(index.goalBudget ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .bold))
                                                
                                                Text("\(index.goalName ?? "")")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .underline(true, color: .white)
        
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("$0")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 11, weight: .regular))
                                                
                                                Text("You need to save up")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 11, weight: .regular))
                                            }
                                            .padding(8)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                        }
                                        
                                        Text("Number of payments: \(viewModel.histories.count)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top, 7)

                                        HStack {
                                            
                                            Text("History")
                                                .foregroundColor(.white)
                                                .font(.system(size: 22, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isAddHistory = true
                                                }
                                                
                                                
                                            }, label: {
                                                
                                                Image(systemName: "plus")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .regular))
                                            })
                                        }
                                        .padding(.vertical)
                                        
                                        if viewModel.histories.isEmpty {
                                            
                                            VStack {
                                                
                                                Text("There are no records")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .regular))
                                            }
                                            .padding()
                                            .padding(.vertical)
                                            .frame(maxWidth: .infinity)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.2), radius: 4))
                                            .padding(3)
                                            
                                        } else {
                                        
                                        ScrollView(.vertical, showsIndicators: false) {
                                            
                                            LazyVStack {
                                                
                                                ForEach(viewModel.histories, id: \.self) { index in
                                                    
                                                    HStack {
                                                        
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            
                                                            Text(index.hisName ?? "")
                                                                .foregroundColor(.black)
                                                                .font(.system(size: 14, weight: .bold))
                                                            
                                                            Text((index.hisDate ?? Date()).convertDate(format: "MMM dd yy"))
                                                                .foregroundColor(.gray.opacity(0.6))
                                                                .font(.system(size: 12, weight: .regular))
                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        Text("$\(index.hisPayment)")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 16, weight: .medium))
                                                        
                                                        Image(systemName: "chevron.right")
                                                    }
                                                    
                                                    Rectangle()
                                                        .fill(.gray.opacity(0.5))
                                                        .frame(maxWidth: .infinity)
                                                        .frame(height: 1)
                                                }
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.2), radius: 4))
                                            .padding(3)
                                        }
                                    }
                                    }
                                    .padding()
                                    .frame(width: 350)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("p1")))
                                    
                            }
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
        .onAppear{
            
            viewModel.fetchHistories()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddGoal ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGoal = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.5))
                        .frame(width: 50, height: 5)
                    
                    Text("Create a goal")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.vertical)
                    
                    Menu(content: {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategoryForAdd = index
                                
                            }, label: {
                                
                                    Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentCategoryForAdd.isEmpty {
                            
                            HStack {
                                
                                Text("Category")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.currentCategoryForAdd)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.goalName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Budget")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.goalBudget.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.goalBudget)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                        Button(action: {
                            
                            viewModel.goalCategory = viewModel.currentCategoryForAdd
                            
                            viewModel.addGoal()
                            
                            viewModel.goalName = ""
                            viewModel.goalBudget = ""
                            viewModel.currentCategoryForAdd = ""
                            
                            viewModel.fetchGoals()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGoal = false
                            }
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("lbg")))
                            
                        })
                        .padding(.vertical)
                        .opacity(viewModel.currentCategoryForAdd.isEmpty || viewModel.goalName.isEmpty || viewModel.goalBudget.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentCategoryForAdd.isEmpty || viewModel.goalName.isEmpty || viewModel.goalBudget.isEmpty ? true : false)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddGoal ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddHistory ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHistory = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.5))
                        .frame(width: 50, height: 5)
                    
                    Text("Create an entry")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.vertical)
                    
                    Menu(content: {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategoryForAdd = index
                                
                            }, label: {
                                
                                    Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentCategoryForAdd.isEmpty {
                            
                            HStack {
                                
                                Text("Category")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.currentCategoryForAdd)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.hisName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.hisName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Payment")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.hisPayment.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.hisPayment)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)
                    
                    HStack {
                        
                        Text("Payment date")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                        
                        DatePicker("", selection: $viewModel.hisDate, displayedComponents: .date)
                            .labelsHidden()
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                        Button(action: {
                            
                            viewModel.summ += Int(viewModel.hisPayment) ?? 0
                            
                            viewModel.hisCategory = viewModel.currentCategoryForAdd
                            
                            viewModel.addHistory()
                            
                            viewModel.hisName = ""
                            viewModel.hisPayment = ""
                            viewModel.currentCategoryForAdd = ""
                            
                            viewModel.fetchHistories()
            
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddHistory = false
                            }
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("lbg")))
                            
                        })
                        .padding(.vertical)
                        .opacity(viewModel.currentCategoryForAdd.isEmpty || viewModel.hisName.isEmpty || viewModel.hisPayment.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentCategoryForAdd.isEmpty || viewModel.hisName.isEmpty || viewModel.hisPayment.isEmpty ? true : false)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddHistory ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isCurrencies, content: {
            
            CurrenciewView(viewModel: viewModel)
        })
    }
}

#Preview {
    EarningsView()
}
