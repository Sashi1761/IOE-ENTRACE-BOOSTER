import 'dart:ui';

abstract class AppColors {
  static const Color red = Color(0xFFFF6474);
  static const Color orange = Color(0xFFFFAA5B);
  static const Color purple = Color(0xFF9AA0FC);
  static const Color pink = Color(0xFFFBAEAE);
  static const Color green = Color(0xFF71CFB9);
}


// InkWell(
//                                 onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                               child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.yellow,),
//                                child: const Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.search,size: 50,color: Colors.white,),
//                                  Text("Search",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                             ),
//                              InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.settings,size: 50,color: Colors.white,),
//                                  Text("Settings",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),
//                              InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),
//                              InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),
//                    ],
                 






//         Column(
//           children: [
            
//             SizedBox(height: 20,),
//             Container(
         
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
//               margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(
//                 top:10
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                 ),
//                 borderRadius: BorderRadius.circular(20).copyWith(
//                   topLeft:Radius.zero,
//                 )
//               ),
//               child: const Padding(
//                 padding:  EdgeInsets.symmetric(vertical:10, horizontal: 10),
//                 child:  Text('Hello! What Do you Want To Learn Today!', style: TextStyle(color: Colors.black, fontSize: 25),),
//               ),
              
//             ),
//          Expanded(
//            child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Expanded(
//                    child: GridView(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
//                     children: [
//                           const  Expanded
//                             (child: PhysicsCategory()),
//                             InkWell(
//                                 onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                               child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.yellow,),
//                                child: const Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.search,size: 50,color: Colors.white,),
//                                  Text("Search",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                             ),
//                              InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.settings,size: 50,color: Colors.white,),
//                                  Text("Settings",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),
//                              InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),
//                              InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),InkWell(
//                                  onTap: (){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                                },
//                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: [
//                                  Icon(Icons.book,size: 50,color: Colors.white,),
//                                  Text("Books",style: TextStyle(color: Colors.white,fontSize: 30),)
//                                ],),
//                                ),
//                              ),
//                    ],
                 
//                    ),
//                  ),
//                ),
//          ),
         
            
            
            
      
//           ],
//         ),
//       );
    
//   }
// }