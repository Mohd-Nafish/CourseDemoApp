//
//  CourseDetails.swift
//  DesignCode
//
//  Created by Nafish on 12/14/24.
//

import SwiftUI

struct CourseDetails: View {
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView{
            VStack {
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
                            
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16,weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36,height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                                
                            }
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
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Take your swiftUI App store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this course")
                        .font(.title).bold()
                    
                    Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    
                    Text( "Minimal coding experience required, such as in HTMLand CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll geta lot friendlier! I added a bunck of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                    
                }
                
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CourseDetails(course: courseData[0], show: .constant(true), active: .constant(true),activeIndex: .constant(-1))
}
