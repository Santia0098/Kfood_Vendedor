String textFormarter(String s){
  int lastCharacter = 0;
  int lastSpace = -1;
  int index = -1;
  int characterNumber = 0;
  int lastSeparator = -1;
  s.runes.forEach((int rune){
    index++;
    var char = new String.fromCharCode(rune);
    if(char!=' ' && char!=':' && char!=',' && char!='}' && char != '{'){
      characterNumber++;

      lastCharacter=index;
      if(characterNumber==1){
        s = s.replaceRange(0, 1, "${s[0]}\"");
        index++;
        lastCharacter++;

      }
      if(lastSpace==index-1 && lastSeparator==index-2){
        s = s.replaceRange(lastSpace, lastSpace+1, "${s[lastSpace]}\"");
        index++;
        lastCharacter++;
        lastSpace++;
        lastSeparator++;
      }
    }else if(char==':' || char==',' || char=='}'){
      s = s.replaceRange(lastCharacter, lastCharacter+1, "${s[lastCharacter]}\"");
      index++;
      lastSeparator=index;
      lastCharacter++;
      lastSpace++;
    }else if(char==' '){
      lastSpace=index;
    }
  });
  print(s);
  return s;
}