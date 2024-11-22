%include 'in_out.asm'
section .data
msg1 db 'Введите A: ',0h
msg2 db "Введите B: ",0h
msg3 db "Введите C: ",0h
msg4 db "Наименьшее число: ",0h
section .bss
min resb 20
A resb 20
B resb 20
C resb 20
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите A: '
mov eax,msg1
call sprint
; ---------- Ввод 'A'
mov ecx,A
mov edx,20
call sread
; ---------- Преобразование 'A' из символа в число
mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа в 'A'
; ---------- Вывод сообщения 'Введите B: '
mov eax,msg2
call sprint
; ---------- Ввод 'B'
mov ecx,B
mov edx,20
call sread
; ---------- Преобразование 'B' из символа в число
mov eax,B
call atoi ; Вызов подпрограммы перевода символа в число
mov [B],eax ; запись преобразованного числа в 'B'
; ---------- Вывод сообщения 'Введите C: '
mov eax,msg3
call sprint
; ---------- Ввод 'C'
mov ecx,C
mov edx,20
call sread
; ---------- Преобразование 'C' из символа в число
mov eax,C
call atoi ; Вызов подпрограммы перевода символа в число
mov [C],eax ; запись преобразованного числа в 'C'
; ---------- Записываем 'A' в переменную 'min'
mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'
; ---------- Сравниваем 'A' и 'С' (как символы)
cmp ecx,[C] ; Сравниваем 'A' и 'С'
jg check_B ; если 'A<C', то переход на метку 'check_B',
mov ecx,[C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'
; ---------- Преобразование 'max(A,C)' из символа в число
check_B:
mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax ; запись преобразованного числа в `min`
; ---------- Сравниваем 'min(A,C)' и 'B' (как числа)
mov ecx,[min]
cmp ecx,[B] ; Сравниваем 'max(A,C)' и 'B'
jg fin ; если 'min(A,C)<B', то переход на 'fin',
mov ecx,[B] ; иначе 'ecx = B'
mov [min],ecx
; ---------- Вывод результата
fin:
mov eax, msg4
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход
