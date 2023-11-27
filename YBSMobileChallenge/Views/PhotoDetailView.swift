//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo
    @State private var animate = false
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                AsyncImage(url: URL(string: photo.media.m.absoluteString)) { image in
                    image.resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 8)
                        .padding([.leading, .trailing, .top], 10)
                        .scaleEffect(animate ? 1 : 0.45)
                } placeholder: {
                    ProgressView()
                }
                
                Text(photo.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                    .opacity(animate ? 1 : 0)
                
                Divider()
                
                Text("Taken on \(formattedDate(photo.dateTaken ?? Date()))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 10)
                
                Divider()
                
                Text("Tags")
                    .font(.headline)
                    .padding(.leading, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(photo.tagList, id: \.self) { tag in
                            Text(tag)
                                .padding(.all, 5)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(5)
                                .transition(.move(edge: .trailing))
                        }.onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    animate = true
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 10)
        }
        .navigationTitle("Photo Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
