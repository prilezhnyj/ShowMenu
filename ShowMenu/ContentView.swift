//
//  ContentView.swift
//  ShowMenu
//
//  Created by Максим Боталов on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    
    var body: some View {
        
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            
            LeadingMenuView(showMenu: $showMenu)
                .clipShape(RoundedRectangle(cornerRadius: showMenu ? 20 : 0, style: .continuous))
                .scaleEffect(showMenu ? 0.9 : 1)
                .shadow(color: .black.opacity(0.3), radius: 20, x: -5)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: showMenu ? "xmark" : "line.3.horizontal")
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .rotationEffect(.degrees(showMenu ? 90 : 0))
                            .foregroundColor(showMenu ? .red : .black)
                            .animation(.linear(duration: 0.2))
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 25)
                    
                    Spacer()
                }
                
                Spacer()
                
                Text("Главный экран")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: showMenu ? 20 : 0, style: .continuous))
            .scaleEffect(showMenu ? 0.85 : 1)
            .shadow(color: .black.opacity(0.3), radius: 20, x: -5)
            .offset(x: showMenu ? 180 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
            .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LeadingMenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                VStack(spacing: 10) {
                    Image("Max")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    
                    VStack(spacing: 0) {
                        
                        Text("Максим Боталов")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                        
                        Text("24 года, iOS-разработчик")
                            .font(.system(size: 11, weight: .regular, design: .default))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Button {
                        //
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "house")
                            Text("Главный экран")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "newspaper")
                            Text("Новости")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "person.2")
                            Text("Друзья")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "message.and.waveform")
                            Text("Сообщения")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    Button {
                        //
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "gear")
                            Text("Настройки")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    
                }
                .padding(.top, 30)
                
                Spacer()
                
                Button {
                    showMenu.toggle()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "xmark")
                        Text("Выйти")
                            .font(.system(size: 14, weight: .medium))
                        
                    }
                    .foregroundColor(.red)
                }
            }
            .frame(width: 150)
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
            Spacer()
        }
        .background(Color.white)
    }
}
