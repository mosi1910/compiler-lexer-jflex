%%

%public
%line
%column
%class Parser
%unicode

%caseless
%standalone
%ignorecase


New_Line          = \r|\n|\r\n
Space             = [ \t\f]
WhiteSpace        = {Space} | {New_Line}

// numeral //
Digit             = [0-9]
Integer  = {Digit}+
Double    = {Integer} "." {Integer}
Float    = {Double}[fF]

// Identifiers //
Letter            = [a-zA-Z]
Identifier        = ({Letter}|"_") ("_" | {Letter} | {Digit})*

// String //
String_Text       = (\\\" | [^\n\r\"])*

// Comment //
Comment_Text      = [^\r\n]*

%%

<YYINITIAL> {


    /****Keyword****/
    "begin"     |"do"       |"for"      |"true"     |
    "bool"      |"double"   |"if"       |"try"      |
    "break"     |"else"     |"int"      |"while"    |
    "case"      |"end"      |"return"   |"void"     |
    "class"     |"float"    |"switch"
    { System.out.println("Keyword (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1));}

    
    /****Separator****/
    "("                 { System.out.println("Left Parenthesis (() - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    ")"                 { System.out.println("Right Parenthesis (() - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    "["                 { System.out.println("Left Brackets (() - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    "]"                 { System.out.println("Right Parenthesis (() - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    "{"                 { System.out.println("Left Acolades (() - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    "}"                 { System.out.println("Right Acolades (() - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    "."                 { System.out.println("Dot (.) - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    ","                 { System.out.println("Comma (,) - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    ";"                 { System.out.println("Semicolon (;) - Line %d, Column %d".formatted(yyline+1, yycolumn+1));}
    
    /****Operator****/
    "=" |    "=="|    "!" |    "!="|
    "<" |    "<="|    ">" |    ">="|
    "+" |    "+="|    "-" |    "-="|
    "*" |    "*="|    "/" |    "/="|
    "%" |    "%="|    "++"|    "--"|
    "**"    { System.out.println("Operator (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1));}

    /****String****/
    \" {String_Text} \" { System.out.println("String (%s) - Line %d, Column %d".formatted(yytext().substring(1,yylength()-1), yyline+1, yycolumn+1));}
    
    /****White Space****/
    {WhiteSpace}+       { /*pass*/ }
    
    /*Comment*/
    "//" {Comment_Text} {}
    "/*" [^"*/"]* "*/"  { }
    
    /****Integer numbers****/
    {Integer}  { System.out.println("Integer Literal (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1)); }
    {Double}    { System.out.println("Double Literal (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1)); }
    {Float}    { System.out.println("Float Literal (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1));}
    
    /****Identifier****/
    {Identifier}        { System.out.println("Identifier (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1)); }

    /****It doesn't match with the above patterns****/
    .                   { System.out.println("Error (%s) - Line %d, Column %d".formatted(yytext(), yyline+1, yycolumn+1));}
    
    /****End Of File****/
    // <<EOF>>             { System.out.println("End Of File - Line %d, Column %d".formatted(yyline+1, yycolumn+1)); }
}