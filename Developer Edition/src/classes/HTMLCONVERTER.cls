/*



  GLOBAL GENERIC CLASS CAN BE REUSED TO CONVERT HTML STRING / 
  HTML CONTENTS AND CONVERT TO PLAIN TEXT AND 
  RETURN STRING TYPE OF DATA


*/


global class HTMLCONVERTER 

{

    global static string inputString='';

    global static string HTML_TAG_PATTERN = '<.*?>';

    global static pattern myPattern;

    global static matcher myMatcher;

    global static string GenerateTextFromHtml ()

    {


        myPattern = pattern.compile(HTML_TAG_PATTERN);

        myMatcher = myPattern.matcher(inputString);


        return myMatcher.replaceAll('');


    }




}