//
//  ContentView.swift
//  UP2
//
//  Created by Luis Rodriguez on 13/11/25.
// hola

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showingInstructions = false

    var body: some View {
    ZStack {
        Color(.systemBackground)
            .ignoresSafeArea()

        VStack {
            VStack(spacing: 120) {
                Text("Welcome")
                    .font(.system(size: 48, weight: .bold))
                    .fontWeight(.bold)

                Button("Get Started") {
                    showingInstructions = true
                }
                .font(.system(size: 24, weight: .bold))
                .padding(.horizontal, 50)
                .padding(.vertical, 19)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(12)
            }

            Spacer()
        }
        .padding(.top, 230)
        .sheet(isPresented: $showingInstructions) {
            InstructionsView()
        }
    }
}
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

struct InstructionsView: View {
    @State private var instructionsText: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome! I'm your new companion on your journey to a healthier lifestyle.")
                    .font(.title2)
                    .fontWeight(.semibold)

                
                Text("First select your gender, age, height, weight, and activity level.")
                    .font(.body)
                Text("Then, you can start tracking your progress.")
                    .font(.body)
                Text("You can also set your goals and track your progress.")
                    .font(.body)
                Text("Then select your companion that will be accompanying you on your journey.")
                    .font(.body)
                Text("Earn points and level up with your companion.")
                    .font(.body)
                Text("You can also set your goals and track your progress.")
                    .font(.body)

                Spacer()
            }
            .padding()
            .navigationTitle("Welcome! I'm your new companion on your journey to a healthier lifestyle.")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
