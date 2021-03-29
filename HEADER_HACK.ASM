
format MZ
entry  main:start

;db 2E0h dup 0

segment main use16

start:

mov     ax,4C00h
int     21h


