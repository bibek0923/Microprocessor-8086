title to find factorial of number 
.model small
.stack 100
.data   
nline db 0dh,0ah,'$'
str1 db "enter a number $" 
num dw 0  
fact dw 1

str2 db "fact = $"
.code
proc main far
    mov ax,@data
    mov ds,ax    
    
    
      lea dx,str1
      mov ah,09h
      int 21h
 
       call newline
    ; reading number of any digits   
    nextnum: mov ah,01
     int 21h  
     cmp al,0dh
     je skip
     sub al,48
     mov bl,al
     mov bh,0
     mov ax,10
     mul num
     add ax,bx
     mov num,ax
     jmp nextnum
     
     
 
       
       skip: 
    mov cx,num
    mov ax,1
   up: mul cx
    loop up 
    mov fact,cx
    
      
      
      
     
     
      skipp:  mov fact,ax
     
     call newline    
     
         
       lea dx,str2
      mov ah,09h
      int 21h
         
     call display_num
             
     
     
     
           
     mov ah,4ch
     int 21h        
    main endp  
  newline proc near    
    lea dx , nline
    mov ah,09h
    int 21h
    ret
    newline endp  
  
  display_num proc near
    mov ax,fact
    mov bx,10
    mov si,0
   next:mov dx,0
   div bx
   push dx 
   inc si
   cmp ax,0
   jnz next   
    
   mov cx,si 
  here:  pop dx 
   add dl,48
   mov dh,0
   mov ah,02h
   int 21h  
   loop here
   ret 
   display_num endp
      
 
end
