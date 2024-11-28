%include 'in_out.asm'
SECTION .data
prim DB 'f(x)=12x-7',0
otv DB 'Результат: ',0
SECTION .text
global _start
_start:
pop ecx
pop edx
sub ecx,1
mov esi,0
mov eax,prim
call sprintLF
next:
cmp ecx,0
jz _end
mov ebx,12
pop eax
call atoi
mul ebx
add eax,-7
add esi,eax
loop next
_end:
mov eax,otv
call sprint
mov eax,esi
call iprintLF
call quit
