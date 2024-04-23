.model small
.stack 100h

.data 
   nline dw 0dh,0ah,'$'
    numbers dw 9, 20, 30, 40, 50, 60, 70, 80, 90, 123
    count dw 10
    min dw ?
    max dw ? 
    num dw ?
    fact dw ?

.code
  main proc far
    mov ax, @data
    mov ds, ax

    mov cx, count
    lea si, numbers

    ; Initialize min and max with the first number
    mov ax, [si]
    mov min, ax
    mov max, ax

    ; Loop through the rest of the numbers
    add si, 2
    dec cx
    jz done

next_number:
    mov ax, [si]
    cmp ax, min
    jb new_min
    cmp ax, max
    ja new_max
    jmp next

new_min:
    mov min, ax
    jmp next

new_max:
    mov max, ax

next:
    add si, 2
    dec cx
    jnz next_number


    ; At this point, min and max contain the smallest and largest numbers 
    
  done:
  call newline
  mov ax,min  
  mov fact,ax
  call display_num
    call newline  
    mov ax,max
    mov fact,ax
   
    call display_num

    mov ax, 4c00h
    int 21h
    main endp
 display_num proc near
    mov ax,fact
    mov bx,10
    mov si,0
   nextdig:mov dx,0
   div bx
   push dx 
   inc si
   cmp ax,0
   jnz nextdig   
    
   mov cx,si 
  here:  pop dx 
   add dl,48
   mov dh,0
   mov ah,02h
   int 21h  
   loop here
   ret 
   display_num endp    
 
  newline proc near
    lea dx,nline
    mov ah,09h
    int 21h
    ret
    newline endp
end
