//
//  ContentView.swift
//  Counter
//
//  Created by Kota Aso on 2024/04/02.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var isShowAlert = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                if count < 0 {
                    Text("\(count)")
                        .foregroundColor(.red)
                        .font(.system(size: 130, weight: .bold, design: .default))
                } else {
                    Text("\(count)")
                        .foregroundColor(.black)
                        .font(.system(size: 130, weight: .bold, design: .default))
                }
                HStack {
                    Button {
                        count -= 1
                    } label: {
                        Text("-")
                            .frame(height: UIScreen.main.bounds.height/2.5)
                            .frame(maxWidth: .infinity)
                            .background(Color("MinusButtonColor"))
                            .foregroundColor(.white)
                            .font(.system(size: 130, weight: .bold, design: .default))
                            .cornerRadius(10)
                    }
                    Button {
                        count += 1
                    } label: {
                        Text("+")
                            .frame(height: UIScreen.main.bounds.height/2.5)
                            .frame(maxWidth: .infinity)
                            .background(Color("PlusButtonColor"))
                            .foregroundColor(.white)
                            .font(.system(size: 130, weight: .bold, design: .default))
                            .cornerRadius(10)

                    }
                }
                Spacer()
                Button {
                    isShowAlert = true
                } label: {
                    Text("リセットする")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.white)
                        .foregroundColor(.red)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.red, lineWidth: 1))
                }
                .alert("注意", isPresented: $isShowAlert) {
                    Button("リセットする", role: .destructive){
                        count = 0
                    }
                    Button("キャンセル" ,role: .cancel){}
                } message: {
                    Text("現在のカウントをリセットしますが、本当によろしいでしょうか？")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
