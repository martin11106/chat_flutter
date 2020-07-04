class ValidationMixins{
  String validationEmail(String value){

    if(!value.contains('@')){
      return "email invalido";
    }else{
        return null;
    }

  }
  String validationPassword(String value) {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    if(value.length > 6&& value.isEmpty&&regExp.hasMatch(value)){
      return "password invalida";
    }else{
      return null;
    }
  }
}