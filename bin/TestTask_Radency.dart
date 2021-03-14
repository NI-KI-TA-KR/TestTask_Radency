String StockSummary(List<String> ListOfArt, List<String> List1osLetter){
  
  if(ListOfArt.isEmpty || List1osLetter.isEmpty) return ''; // якщо один із список пустий - повернути 
  
  var result = '';
  var SumInCaterogy = List.filled(List1osLetter.length, 0);

  final RegexLine = RegExp(r'^([A-Z])[A-Z]*\s(\d+)');
  
  for(var i = 0; i != ListOfArt.length; i++)
  {
     if(RegexLine.hasMatch(ListOfArt[i])){   

        final match = RegexLine.firstMatch(ListOfArt[i]);

        for(var j = 0; j != List1osLetter.length; j++){

          if(match.group(1) == List1osLetter[j]){   // якщо перша літера співпадає з однією з переліку
            SumInCaterogy[j] += int.parse(match.group(2));  // додати до суми кількості книг
          }
        }
     }
  }
  
  for(var i = 0; i != List1osLetter.length; i++){

    if( i == List1osLetter.length - 1){  // якщо це останній елемент - не писати дефіз
      result += ' (' + List1osLetter[i] +' : ' + SumInCaterogy[i].toString() + ')';
      break;
    }

    result += ' (' + List1osLetter[i] +' : ' + SumInCaterogy[i].toString() + ') -';

  }
  
  return result;
}

  

void main() {
    print(StockSummary(['ABART 20', 'CDXEF 50', 'BKWRK 25', 'BTSQZ 89', 'DRTYM 60'], ['A', 'B', 'C', 'W']));
     //(A : 20) - (B : 114) - (C : 50) - (W : 0))
     print(StockSummary([], ['B', 'R', 'D', 'X'])); //
 }  