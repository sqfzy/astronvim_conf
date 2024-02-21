return {
  s("!", {
    t { "assume cs:codesg" },
    t { "", "codesg segment" },
    t { "", "  " },
    i(1), -- 在此处开始写,顺序为1,2,3...n,0
    t { "", "", "  mov ax,4c00H" },
    t { "", "  int 21H" },
    t { "", "code ends" },
    t { "", "end" },
  }),
  s("return", t{"mov ax,4c00H", "","  int 21H" })
}
