#make_bin#
#MEM = 7012, 00 08 04 02 03 01 08 02 03 #;BASE: 0700 | INDICE: 0012

org 100h
mov bx, 0700h
mov ds, bx;guarda a base em ds   

mov al, [0012h] ;numeros do cpf
mov bl, 1 ;multiplicador -> bl
mul bl
mov dl,al ;somador -> dl
inc bl
              
mov al, [0013h]
mul bl     
add dl, al
inc bl

mov al, [0014h]
mul bl
add dl, al
inc bl

mov al, [0015h]
mul bl
add dl, al
inc bl

mov al, [0016h]
mul bl
add dl, al
inc bl

mov al, [0017h]
mul bl
add dl, al
inc bl

mov al, [0018h]
mul bl
add dl, al
inc bl

mov al, [0019h]
mul bl
add dl, al
inc bl

mov al, [001Ah]
mul bl
add dl, al
inc bl   

mov bl, 11
mov al, dl ;somatorio dl -> al
div bl
       
mov dh, ah ;primeiro digito -> dh

;---------------------------------- Verificar segundo digito

mov al, [0012h]
mov bl, 0
mul bl
mov cl, al ;segundo somador -> cl
inc bl

mov al, [0013h]
mul bl
add cl, al
inc bl

mov al, [0014h]
mul bl
add cl, al
inc bl

mov al, [0015h]
mul bl
add cl, al
inc bl

mov al, [0016h]
mul bl
add cl, al
inc bl

mov al, [0017h]
mul bl
add cl, al
inc bl

mov al, [0018h]
mul bl
add cl, al
inc bl

mov al, [0019h]
mul bl
add cl, al
inc bl

mov al, [001Ah]
mul bl
add cl, al
inc bl     

mov al, dh 
mul bl
add cl, al
      
      
mov al, cl ;somatorio cl -> al
mov cl, 0
mov bl, 11
div bl      

mov dl, ah ;segundo digito -> dl 

cmp dh, 0ah
jz comp1
cmp dl, 0ah
jz comp2

cont:
hlt 
ret    

comp1: 
mov dh, 0
jz cont
comp2:
mov dl, 0 
jz cont