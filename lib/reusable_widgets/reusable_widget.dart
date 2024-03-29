import 'package:flutter/material.dart';

Image logoWidget(String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 150,
    height: 150,
    color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9)
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.3)
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          width: 0,
          style:  BorderStyle.none
        )
      ),
    ),
    keyboardType: isPasswordType
      ? TextInputType.visiblePassword
      : TextInputType.emailAddress,
  );
}

void setState(Null Function() param0) {
  obscureText: false;
}

Container signInSignUpButton(BuildContext context, String text1, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(210, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
        )
      ),

      child: Text(
        text1,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    ),
  );
}

SnackBar errorMessage(String msg){
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text("ERROR",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Text(msg,
              style: const TextStyle(color: Colors.black54,fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
    ),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

SnackBar ackMessage(String msg){
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text("Info",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Text(msg,
              style: const TextStyle(color: Colors.black54,fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
    ),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Card swapCard(String topic) {
  return Card(
    elevation: 10,
    color: Colors.white12,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.white,
      ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: SizedBox(
      width: 250,
      height:150,
      child: Center(
        child: Text(
          topic,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
          ),
        ),
      ),
    ),
  );
}