import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{

final FirebaseAuth _auth = FirebaseAuth.instance;


Future registerWithEmailAndPassword(String email, String password, String name, String phoneNumber) async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email:email, password: password);
    FirebaseUser user = result.user;
    return user;
  }catch(e){
    print(e.toString());
    return null;
  }

}

Future<FirebaseUser>getCurrentUser() async{
  try{
   FirebaseUser user = await _auth.currentUser();
    return user;
  }catch(e){
    print(e.toString());
    return null;
  }

}


Future logIn(String email, String password) async{
  
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }catch(e){
    print(e.toString());
    return null;
  }

}


Future logOut() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }

}


}