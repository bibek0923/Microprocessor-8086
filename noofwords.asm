.model small
.stack 100
.data 
  nline db 0dh,0ah,'$' 
  max db 100 
  act db ?
  str db 100 dup('$')
  
  str1 db "enter a string $"
  str2 db "number of words = $"
  count db 1
  
  
.code 
main proc far
    mov ax,@data
    mov ds,ax
    
       lea dx,str1
       mov ah,09h
       int 21h
        
        call newline 
        
        lea dx,max
        mov ah,0ah
        int 21h
        
          call newline
        
        mov si,0
        mov cl,act
        mov ch , 0
      nextchar:  mov dl,str[si]
        cmp dl,32
        jnz skip
        inc count
        skip:inc si
        loop nextchar
        
           
            lea dx,str2
       mov ah,09h
       int 21h
           
           
                 
            mov dl,count
            add dl,48
            mov ah,02h
            int 21h
                 
         ; call display_num
    
    
    
    mov ah,4ch
    int 21h
    main endp   

display_num proc near
    
    
    
    
    
    

newline proc near
    lea dx,nline
    mov ah,09h
    int 21h
    ret
    newline endp

end