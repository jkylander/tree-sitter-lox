; Comments
(comment) @comment

; Keywords
[
  "class"
  "else"
  "for"
  "fun"
  "if"
  "return"
  "var"
  "while"
] @keyword
[
 "super"
 (this)
] @variable.builtin
"print" @function.builtin

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "="
  "!"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "and"
  "or"
] @operator

; Punctuations
[
  "{"
  "}"
  "("
  ")"
  ","
  "."
  ";"
] @punctuation

; Literals
(string) @string
(number) @constant
(nil) @constant
(bool) @constant

; Function / method declaration
(function
  name: (identifier) @function
)

; Function call
(expr_call
  (expr_primary
    (var
      name: (identifier) @function
    )
  )
)

; Class declaration
(decl_class
  name: (identifier) @class
  extends: (extends)? @keyword
  base: (identifier)? @class
)

; Function declaration
(function
  name: (identifier) @function
)

; Method call
(expr_call
  callee: (expr_field
    field: (identifier) @function
  )
)
(expr_call
  callee: (expr_primary
    (super
      field: (identifier) @function
    )
  )
)

; Field access
(expr_field
  field: (identifier) @variable.member (#set! priority 95)
)
[
 (super field: (identifier))
 (params)
 ] @variable.parameter

; Variable
((identifier) @variable (#set! priority 90))
