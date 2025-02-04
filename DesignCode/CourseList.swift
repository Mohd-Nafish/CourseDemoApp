//
//  CourseList.swift
//  DesignCode
//
//  Created by Nafish on 12/11/24.
//

import SwiftUI

struct CourseList: View {
//    @State var show = false
    @State var active = false
    @State var courses  = courseData
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(self.activeView.height / 500)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30) {
                    Text("Courses").font(.largeTitle).bold()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,30)
                        .padding(.top,30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(courses.indices,id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: self.$courses[index].show,
                                       course: self.courses[index],
                                       active: self.$active,
                                       index: index,
                                       activeIndex: self.$activeIndex, activeView: self.$activeView
                            )
                                .offset(y:self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width-60)
                        .zIndex(self.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5,dampingFraction: 0.6,blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
        
    }
}

#Preview {
    CourseList()
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack (alignment: .top){
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your swiftUI App store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title).bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                
                Text( "Minimal coding experience required, such as in HTMLand CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll geta lot friendlier! I added a bunck of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                
            }
            
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width-60)
            .frame(maxHeight: show ? .infinity : 280,alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x:0, y:20)
            .opacity(show ? 1 : 0)
            
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24,weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16,weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36,height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                }
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140,alignment: .top)
            }
            .padding(show ? 40:20)
            .padding(.top, show ? 30 : 0)
            //        .frame(width:show ? screen.width : screen.width-60,height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width-60,maxHeight: show ? 460 : 280)
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x:0, y:20)
           
            .gesture(
                show ?
                DragGesture().onChanged{ value in
                    guard value.translation.height < 300 else{return}
                    guard value.translation.height > 0 else{return}
                        self.activeView = value.translation
    
                }
                .onEnded{ value in
                    if self.activeView.height > 50{
                        self.show = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show{
                    self.activeIndex = self.index
                }else{
                    self.activeIndex = -1
                }
            }
            if show{
//                CourseDetails(course: course, show: $show, active: $active, activeIndex: $activeIndex)
//                    .background(Color.white)
//                    .animation(nil)
            }
        }
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x:0, y: 10.0, z:0))
        .hueRotation(Angle(degrees:Double(self.activeView.height)))
        .animation(.spring(response: 0.3,dampingFraction: 1.5,blendDuration: 0))
        .gesture(
            show ?
            DragGesture().onChanged{ value in
                guard value.translation.height < 300 else{return}
                guard value.translation.height > 0 else{return}
                    self.activeView = value.translation

            }
            .onEnded{ value in
                if self.activeView.height > 50{
                    self.show = false
                    self.active = false
                    self.activeIndex = -1
                }
                self.activeView = .zero
            }
            : nil
        )
        .ignoresSafeArea(.all)
    }
}


struct Course: Identifiable {
    var id  = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
    
}


var courseData = [
    Course(title: "Prototype design in swiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Card2"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), show: false),
    Course(title: "SwiftUI andvanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card2"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI design for developers", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card5"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), show: false)
]
