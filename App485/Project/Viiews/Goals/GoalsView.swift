//
//  GoalsView.swift
//  App485
//
//  Created by IGOR on 22/04/2024.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = GoalsViewModel()
    
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
                    
                    Text("Goals")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
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
                .padding(.vertical)
                
                if viewModel.goals.isEmpty {
                    
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
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        
                                        Text("100%")
                                            .foregroundColor(.white)
                                            .font(.system(size: 7, weight: .regular))
                                        
                                        Circle()
                                            .stroke(.white, lineWidth: 3)
                                            .frame(width: 30, height: 30)
                                        
                                    }
                                }
                                
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
                            .padding()
                            .frame(width: 170, height: 130)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("p1")))
                        })
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.goals, id: \.self) { index in
                                
                                if viewModel.currentCategory == "Courses" {
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedGoal = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
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
                                                
                                                Spacer()
                                                
                                                ZStack {
                                                    
                                                    Text("100%")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 7, weight: .regular))
                                                    
                                                    Circle()
                                                        .stroke(.white, lineWidth: 3)
                                                        .frame(width: 30, height: 30)
                                                    
                                                }
                                            }
                                            
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
                                        .padding()
                                        .frame(width: 170, height: 130)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("p1")))
                                    })
                                    
                                } else if viewModel.currentCategory == "Books" {
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedGoal = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
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
                                                
                                                Spacer()
                                                
                                                ZStack {
                                                    
                                                    Text("100%")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 7, weight: .regular))
                                                    
                                                    Circle()
                                                        .stroke(.white, lineWidth: 3)
                                                        .frame(width: 30, height: 30)
                                                    
                                                }
                                            }
                                            
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
                                        .padding()
                                        .frame(width: 170, height: 130)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("p2")))
                                    })
                                    
                                } else if viewModel.currentCategory == "Other" {
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedGoal = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
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
                                                
                                                Spacer()
                                                
                                                ZStack {
                                                    
                                                    Text("100%")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 7, weight: .regular))
                                                    
                                                    Circle()
                                                        .stroke(.white, lineWidth: 3)
                                                        .frame(width: 30, height: 30)
                                                    
                                                }
                                            }
                                            
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
                                        .padding()
                                        .frame(width: 170, height: 130)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("p3")))
                                    })
                                }
                            }
                        }
                    }
                    .frame(height: 130)
                }
                
                HStack {
                    
                    Text("History")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHistory = true
                        }
                        
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
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
                            
                            Button(action: {
                                
                                viewModel.selectedHistory = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetailHistory = true
                                }
                                
                            }, label: {
                                
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
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                }
                            })
                            
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
                
                Color.black.opacity(viewModel.isDetailHistory ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetailHistory = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.5))
                        .frame(width: 50, height: 5)
                    
                    Text("History")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.vertical)


                            HStack {
                                
                                Text(viewModel.selectedHistory?.hisCategory ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()

                            }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                    Text(viewModel.selectedHistory?.hisName ?? "")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                    Text("\(viewModel.selectedHistory?.hisPayment)")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)
                    
                    Text((viewModel.selectedHistory?.hisDate ?? Date()).convertDate(format: "MM.dd.YYYY"))
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetailHistory = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("lbg")))
                            
                        })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteHistory = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(Color.black))
                        
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isDetailHistory ? 0 : UIScreen.main.bounds.height)
            }
                .overlay(
                    
                    ZStack {
                        
                        Color.black.opacity(viewModel.isDeleteHistory ? 0.5 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDeleteHistory = false
                                }
                            }
                        
                        VStack {
                            
                            HStack {
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDeleteHistory = false
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                })
                            }
                            
                            Text("Delete")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                                .padding()
                            
                            Text("Are you sure you want to delete?")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            Button(action: {
                                
                                CoreDataStack.shared.deleteHistory(withHisName: viewModel.selectedHistory?.hisName ?? "", completion: {
                                    
                                    viewModel.fetchHistories()
                                })

                                withAnimation(.spring()) {
                                    
                                    viewModel.isDeleteHistory = false
                                    
                                    viewModel.isDetailHistory = false

                                }
                                
                                        
                            }, label: {
                                
                                Text("Delete")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                            .padding(.top, 25)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDeleteHistory = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                        .padding()
                        .offset(y: viewModel.isDeleteHistory ? 0 : UIScreen.main.bounds.height)
                    }
                )
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDetail ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.5))
                        .frame(width: 50, height: 5)
                    
                    Text("Goal")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.vertical)


                            HStack {
                                
                                Text(viewModel.selectedGoal?.goalCategory ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()

                            }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                    Text(viewModel.selectedGoal?.goalName ?? "")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                    Text("\(viewModel.selectedGoal?.goalBudget)")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))

                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("lbg").opacity(0.5)))
                    .padding(1)

                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("lbg")))
                            
                        })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(Color.black))
                        
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isDetail ? 0 : UIScreen.main.bounds.height)
            }
                .overlay(
                    
                    ZStack {
                        
                        Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = false
                                }
                            }
                        
                        VStack {
                            
                            HStack {
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = false
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                })
                            }
                            
                            Text("Delete")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                                .padding()
                            
                            Text("Are you sure you want to delete?")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            Button(action: {
                                
                                CoreDataStack.shared.deleteGoal(withGoalName: viewModel.selectedGoal?.goalName ?? "", completion: {
                                    
                                    viewModel.fetchGoals()
                                })

                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = false
                                    viewModel.isDetail = false
                                    
                                }
                                        
                            }, label: {
                                
                                Text("Delete")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                            .padding(.top, 25)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                        .padding()
                        .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
                    }
                )
        )
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
    }
}

#Preview {
    GoalsView()
}
