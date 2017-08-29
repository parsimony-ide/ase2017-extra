expr = ID ;
expr = NUMBER ;
expr = array ;
expr = map ;
expr = LPAREN expr RPAREN ;
expr = expr DIV expr ;
expr = expr EXP expr {right} ;
expr = expr MINUS expr ;
expr = expr MOD expr ;
expr = expr PLUS expr ;
expr = expr TIMES expr ;

-array-inner = expr ;
-array-inner = expr COMMA -array-inner ;

-map-inner = key-value ;
-map-inner = key-value COMMA -map-inner ;

array = LBRACKET RBRACKET ;
array = LBRACKET -array-inner RBRACKET ;

assign = DEF ID EQUALS expr SEMICOLON ;

key-value = ID COLON expr ;

map = LBRACE RBRACE ;
map = LBRACE -map-inner RBRACE ;

program = assign ;
program = assign program ;

left {
  expr = expr DIV expr ;
  expr = expr MOD expr ;
  expr = expr TIMES expr ;
}

left {
  expr = expr MINUS expr ;
  expr = expr PLUS expr ;
}

priorities {
  expr = expr EXP expr > expr = expr MOD expr ;
  expr = expr MOD expr > expr = expr PLUS expr ;
}
