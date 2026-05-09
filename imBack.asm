; --- ImBack.asm ---
extern printf, exit          ; On emprunte ces fonctions au système
section .data
    message db "ImBack...", 10, 0 ; 10 = \n, 0 = fin de chaîne

section .text
    global main              ; Pour Windows/GCC, le point d'entrée est souvent 'main'

main:
    sub rsp, 40              ; "Shadow Space" : Windows x64 exige 32 octets de vide sur la pile
    
    lea rcx, [rel message]       ; Premier argument (RCX) : l'adresse de la data
    call printf              ; On appelle la fonction d'affichage
    
    xor rcx, rcx             ; RCX = 0 (Code de retour)
    call exit                ; On quitte proprement