program-header = PROGRAM ID SEMICOLON ;

-function-call-inner = expression ;
-function-call-inner = expression -function-call-inner ;

assignment = ID ARROW expression SEMICOLON ;

exit = EXIT SEMICOLON ;

expression = ID ;
expression = INTEGER ;
expression = function-call ;
expression = LPAREN expression RPAREN ;
expression = expression DIV expression ;
expression = expression EQUIV expression {left} ;
expression = expression EXP expression {right} ;
expression = expression GT expression ;
expression = expression LEQ expression ;
expression = expression MINUS expression ;
expression = expression MOD expression ;
expression = expression OR expression {left} ;
expression = expression PLUS expression ;
expression = expression RSHIFT expression {left} ;
expression = expression TIMES expression ;

function-body = BEGIN statement-list END SEMICOLON ;

function-call = LBRACE -function-call-inner RBRACE ;

function-definition = function-header locals-list function-body ;

function-header = FUNCTION ID LPAREN id-list RPAREN SEMICOLON ;

functions-list = function-definition ;
functions-list = function-definition functions-list ;

globals-list = GLOBALS id-list SEMICOLON ;

id-list = ID ;
id-list = ID COMMA id-list ;

if = IF expression THEN statement-list ENDIF ;

if-else = IF expression THEN statement-list ELSE statement-list ENDIF ;

locals-list = LOCALS id-list SEMICOLON ;

procedure-call = function-call SEMICOLON ;

program-body = BEGIN statement-list END PERIOD ;

program-definition = program-header globals-list functions-list program-body ;

return = RETURN expression SEMICOLON ;

skip = SKIP SEMICOLON ;

statement = assignment ;
statement = exit ;
statement = if ;
statement = if-else ;
statement = procedure-call ;
statement = return ;
statement = skip ;

statement-list = statement ;
statement-list = statement statement-list ;

left {
  expression = expression GT expression ;
  expression = expression LEQ expression ;
}

left {
  expression = expression MINUS expression ;
  expression = expression PLUS expression ;
}

left {
  expression = expression DIV expression ;
  expression = expression MOD expression ;
  expression = expression TIMES expression ;
}

priorities {
  expression = expression EQUIV expression > expression = expression OR expression ;
  expression = expression EXP expression > expression = expression MOD expression ;
  expression = expression LEQ expression > expression = expression EQUIV expression ;
  expression = expression MOD expression > expression = expression RSHIFT expression ;
  expression = expression PLUS expression > expression = expression LEQ expression ;
  expression = expression RSHIFT expression > expression = expression PLUS expression ;
}
