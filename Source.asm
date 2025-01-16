INCLUDE Irvine32.inc
includelib Winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD


.data

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0

temp byte ?

strScore BYTE "Your score is: ",0
currentscore BYTE 0
score_digits BYTE 0

playerX BYTE 22; 20,20
playerY BYTE 15
playerReset BYTE 0
playerCase BYTE 1

timeout WORD 100

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE "s"

;MY OWN DATA                                          
;current cols of the string are 80 and rows are 30(very very important) 

;BYTE "                                                                                ", 0

;BYTE            "################################################################################", 0

mazeArray1  BYTE "    *              *                *       *     *              *  *       *   ", 0
            BYTE "                                                                                ", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "                                                                                ", 0
            BYTE "              ##                          ##                       ##           ", 0
            BYTE "*       *     ##       *     *            ##       *     *         ##          *", 0
            BYTE "              ##                          ##                       ##           ", 0
            BYTE "        *     ##    ###############       ##    ###############    ##          *", 0
            BYTE "              ##    ###############       ##    ###############    ##           ", 0
            BYTE "        *     ##                          ##                       ##           ", 0
            BYTE "              ##          *    *          ##     *          *      ##          *", 0
            BYTE "*             ##                          ##                       ##           ", 0
            BYTE "                                                                                ", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "                           *                             *                      ", 0
            BYTE "              ##                          ##                       ##           ", 0
            BYTE "              ##                          ##                       ##           ", 0
            BYTE "        *     ##          *          *    ##           *     *     ##          *", 0
            BYTE "              ##    ###############       ##    ###############    ##           ", 0
            BYTE "              ##    ###############       ##    ###############    ##           ", 0
            BYTE "              ##                          ##  *                    ##           ", 0
            BYTE "*       *     ##           *              ##                       ##          *", 0
            BYTE "              ##                          ##                       ##           ", 0
            BYTE "                                              *            *                    ", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "                                                                                ", 0
            BYTE "    *     *        *                *       *     *              *  *       *   ", 0


space BYTE " ",0

MazeRow byte ?
MazeCol byte ?
currentMaze DWORD ?

Temp_eax DWORD ?
Temp_ax WORD ?
Temp_cx WORD ?

row byte ?
col byte ?

counter dd 0

isvalid BYTE 1
isEatingCoin BYTE 0

;for generating a random value in a specified range
minRange BYTE 20 ; Minimum value in the range
maxRange BYTE 20 ; Maximum value in the range

randY BYTE ?
randX BYTE ?

num_coins BYTE 48    ;needs to be set according to level
coinChar BYTE '*'

lives BYTE 3
livesDisplay BYTE "Lives: ",0

;Ghost

ghost1X BYTE 60
ghost1Y BYTE 28
ghost1Direction BYTE "a"
ghost1NextDirection BYTE "w"
ghost1timer BYTE 2
ghost1timerRange BYTE 8
ghostEatcoin BYTE 0


;Page1
PacManName  BYTE "                  _______     _        ______  ____    ____       _       ____  _____  ", 0dh,0ah 
            BYTE "                 |_   __ \   / \     .' ___  ||_   \  /   _|     / \     |_   \|_   _| ", 0dh,0ah 
            BYTE "                   | |__) | / _ \   / .'   \_|  |   \/   |      / _ \      |   \ | |   ", 0dh,0ah 
            BYTE "                   |  ___/ / ___ \  | |         | |\  /| |     / ___ \     | |\ \| |   ", 0dh,0ah 
            BYTE "                  _| |_  _/ /   \ \_\ `.___.'\ _| |_\/_| |_  _/ /   \ \_  _| |_\   |_  ", 0dh,0ah 
            BYTE "                 |_____||____| |____|`.____ .'|_____||_____||____| |____||_____|\____| ", 0                                                          


PromptGetName BYTE "Enter your first name(without spaces): ",0
PlayerName BYTE 20 DUP('0')
name_len BYTE 0

;Menu
MenuOptions BYTE "                     __ __  ___  _ _  _ _  ", 0dh,0ah                                          
            BYTE "                    |  \  \| __>| \ || | |           ", 0dh,0ah                                
            BYTE "                    |     || _> |   || ' |                     ", 0dh,0ah                      
            BYTE "                    |_|_|_||___>|_\_|`___'                               ", 0dh,0ah            
            BYTE "                                                               ", 0dh,0ah  
            BYTE " _  _   ___    _              _     ___                          ", 0dh,0ah
            BYTE "/ |<_> / __> _| |_ ___  _ _ _| |_  /  _>  ___ ._ _ _  ___        ", 0dh,0ah
            BYTE "| | _  \__ \  | | <_> || '_> | |   | <_/\<_> || ' ' |/ ._>       ", 0dh,0ah
            BYTE "|_|<_> <___/  |_| <___||_|   |_|   `____/<___||_|_|_|\___.       ", 0dh,0ah
            BYTE "                                                                ", 0dh,0ah
            BYTE " ___  _   _             _                   _    _               ", 0dh,0ah
            BYTE "<_  ><_> | |._ _  ___ _| |_ _ _  _ _  ___ _| |_ <_> ___ ._ _  ___", 0dh,0ah
            BYTE " / /  _  | || ' |<_-<  | | | '_>| | |/ | ' | |  | |/ . \| ' |<_-<", 0dh,0ah
            BYTE "<___><_> |_||_|_|/__/  |_| |_|  `___|\_|_. |_|  |_|\___/|_|_|/__/", 0dh,0ah
            BYTE "                                                                 ", 0dh,0ah
            BYTE " ____ _   ___      _    _                                        ", 0dh,0ah
            BYTE "<__ /<_> | __>__  <_> _| |_                                      ", 0dh,0ah
            BYTE " <_ \ _  | _> \ \/| |  | |                                       ", 0dh,0ah
            BYTE "<___/<_> |___>/\_\|_|  |_|                                       ", 0
                                                                 

menuInput BYTE ?

;Instructions
InstructionsScreen BYTE "             INSTRUCTIONS: ",0dh,0ah,"             w: up ",0dh,0ah,"             a: left ",0dh,0ah,"             s: down",0dh,0ah,"             d: right",0dh,0ah,"             Eat Coins for score",0dh,0ah,"             Ghosts will try to kill you!",0dh,0ah,"             (Press any key to exit)",0dh,0ah,0

;Paused
PausedStr BYTE "PAUSED (press any key to continue)",0
RemovePausedStr BYTE "                                   ",0


;GameOver
GameOverPrompt BYTE" ___   ___  __ __  ___   ___  _ _  ___  ___ ",0dh,0ah
               BYTE"/  _> | . ||  \  \| __> | . || | || __>| . \",0dh,0ah
               BYTE"| <_/\|   ||     || _>  | | || ' || _> |   /",0dh,0ah
               BYTE"`____/|_|_||_|_|_||___> `___'|__/ |___>|_\_\",0dh,0ah
               BYTE"             Score: ",0dh,0ah,"             Name: ",0

level BYTE 1
level1Prompt BYTE "Level: 1",0
level2Prompt BYTE "Level: 2",0

;LEVEL 2
mazeArray2  BYTE "    *              *                *       *     *              *  *       *   ", 0
            BYTE "                                                                                ", 0
            BYTE "   ######################################   #################################   ", 0
            BYTE "     $                 ##    ##                      ##    ##            $      ", 0
            BYTE "   #############       ##    ##           ##         ##    ##      ##########   ", 0
            BYTE "*  ##         ##       ########           ##       * ########      ##      ##  *", 0
            BYTE "   ##         ##                          ##                       ##      ##   ", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "        *     ##                          ##                       ##           ", 0
            BYTE "              ##          *    *          ##     *          *      ##          *", 0
            BYTE "*             ##                       ###  ###                    ##           ", 0
            BYTE "                                       ##    ##                                 ", 0
            BYTE "   ######################    ###########      #########    ##################   ", 0
            BYTE "                           $           ##    ##          $                      ", 0
            BYTE "*             ##                       ###  ###                    ##           ", 0
            BYTE "              ##                          ##                       ##           ", 0
            BYTE "        *     ##          *          *    ##           *     *     ##          *", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "   ######################    ##########################    ##################   ", 0
            BYTE "*  ##         ##       *     *            ##       *     *         ##      ##  *", 0
            BYTE "   ##         ##       ########           ##         ########      ##      ##   ", 0
            BYTE "   #############       ##    ##           ##         ##    ##      ##########   ", 0
            BYTE " $                     ##    ##               *      ##    ##                 $ ", 0
            BYTE "   ##########################################################################   ", 0
            BYTE "                                                                                ", 0
            BYTE "    *     *        *                *       *     *              *  *       *   ", 0

;FILE HANDLING
fileName    BYTE "players.txt",0
fileName2    BYTE "temp.txt",0
fileHandle  HANDLE ?
fileHandle2 HANDLE ?
filesize BYTE ?

buffer BYTE 500 DUP(?)

scoreArray BYTE 20 DUP(0)
nameArray BYTE 20 * 20 DUP(0) ; Assuming a maximum of 20 players with 20 characters each

levelArray      BYTE 20 DUP(0)

players_infile BYTE 0
threshold_infile BYTE 0
already_added BYTE 0    ;flag

count1 BYTE 0
count2 BYTE 0


scoreStr BYTE 4 dup(0)
levelStr BYTE ?

threshold BYTE ?

FileendMarker BYTE "/",0

lineEnd Word 0d0ah,0

content_inBuffer Word 0

                                        ;BONUS

;SOUND
eatCoinSound BYTE "pacman_chomp.wav",0

eatFruitSound BYTE "pacman_eatfruit.wav",0

killedSound BYTE "pacman_death.wav",0

startSound BYTE "pacman_beginning.wav",0

.code
Savetofile PROC

    call Scoretostr     ;score is saved as a string    

    ; Opening the file for reading
    mov edx, OFFSET fileName
    call OpenInputFile
    mov fileHandle, eax
    cmp eax, INVALID_HANDLE_VALUE
    jne FileExists

    ;if file does not already exist then just add the current score and close

    mov edx, OFFSET fileName
    call CreateOutputfile
    mov fileHandle2, eax

    mov eax, filehandle2
    movzx ecx, name_len
    mov edx, offset playerName
    call WriteToFile
    
    mov eax, filehandle2
    movzx ecx, score_digits
    mov edx, OFFSET scorestr
    call WriteToFile

    mov eax, filehandle2
    mov ecx,1
    mov edx, OFFSET levelStr
    call WriteToFile

    mov eax, filehandle2
    mov ecx,1
    mov edx, OFFSET lineEnd
    call WriteToFile

    mov eax, filehandle2
    mov ecx,1
    mov edx, OFFSET FileendMarker
    call WriteToFile

    mov eax, filehandle2
    call closeFile

    ret

    FileExists:         ;FILE ALREADY EXISTS

    mov esi, offset buffer

    ; Initializing counters
    mov players_infile, 0
    mov ebx,0

    mov edx, offset buffer
    mov ecx,500
    call ReadFromfile
    mov content_inBuffer, ax
    ;buffer contains the file contents

    mov eax, fileHandle
    call CloseFile

    mov edi, OFFSET nameArray

    mov row,0
    mov col,0

    mov edx,offset Buffer

    mov threshold,0
    ReadFileLoop:
        mov al, [edx]
        cmp al,"/"
        je ReadingDone

        ReachScoreLoop:
            inc edx
            inc threshold
            mov al, [edx]
            cmp al," "
            je ScoreFound

        jmp ReachScoreLoop
        ScoreFound:

        mov ebx,0
        ReadScoreLoop:
            inc edx
            inc threshold

            mov al,[edx]
            cmp al,' '
            je ScoreReadSuccess
            sub al,'0'
            imul ebx,10d
            add bl,al
            
        jmp ReadScoreLoop

        ScoreReadSuccess:   ;score in file is stored in ah

        cmp bl, currentscore
        jl ReadingDone
        movzx ecx,threshold
        add edx,5d   ;go to next line
        mov al, threshold
        add al,5d
        mov threshold,al

    jmp ReadFileLoop

    ReadingDone:

    add cl,4
    mov threshold,cl    ;now threshold contains the line before new addition

    ;calculating total size of the file
    mov edx,offset Buffer
    flSizeLoop:
    inc fileSize
    mov al,[edx]
    inc edx
    cmp al,"/"
    jne flSizeLoop



    ;everything is set, so now writing to file

    mov edx, OFFSET fileName
    call CreateOutputfile
    mov fileHandle2, eax

    cmp eax , INVALID_HANDLE_VALUE
    je invalidHndl

    mov esi, offset buffer
    movzx ecx,threshold
    mov edx, offset buffer
    call WriteToFile


    mov eax, filehandle2
    movzx ecx, name_len
    mov edx, offset playerName
    call WriteToFile
    
    mov eax, filehandle2
    movzx ecx, score_digits
    mov edx, OFFSET scorestr
    call WriteToFile

    mov eax, filehandle2
    mov ecx,1
    mov edx, OFFSET levelStr
    call WriteToFile

    mov eax, filehandle2
    mov ecx,1
    mov edx, OFFSET lineEnd
    call WriteToFile

    ;Now the new entry has been made
    ;finally add rest of the file

    mov eax, filehandle2
    mov edx, OFFSET buffer

    movzx ecx, fileSize     ;Total characters in file
    movzx ebx, threshold
    sub ecx, ebx      ;chars after threshold

    add edx, ebx      ;edx starts after the content already written
    call WriteToFile

    mov eax, filehandle2
    call closeFile


    invalidHndl:

ret
Savetofile ENDP

Scoretostr PROC
    movzx eax, currentscore
    mov ebx,10
    mov count1,0
    Check_digits_score:
        inc count1
    xor edx, edx    ; Clear the high part (edx) before division
    div ebx
        cmp al,0
        je digits_score_found

    jmp Check_digits_score

    digits_score_found:

    movzx ebx,count1
    mov score_digits, bl
    inc score_digits

    mov edi, OFFSET scoreStr
    add edi,ebx
    movzx eax,currentscore

    mov ebx,10
    Create_score_str:
        dec edi
    xor edx, edx    ; Clear the high part (edx) before division
    div ebx
        add dl, '0'
        mov [edi], dl
        test eax,eax
    jnz Create_score_str

    ;now score has been saved as a string in score str

    ;converting level to string
    mov al, level
    add al,'0'
    mov levelStr,al

    ;calculating length ofplayer name
    mov name_len,0
    mov esi,offset PLAYERNAME

    lenname:
    mov al, [esi]
    cmp al, 0
    je namelencalculated
    inc name_len
    inc esi
    jmp lenname

    namelencalculated:
    inc name_len    ;to add space character

ret
Scoretostr ENDP

main PROC
    
    mov currentMaze,offset mazearray1
    ;Intro page
    call Page1
    call clrscr

    ;Menu page
    call Menu
    cmp al, '3'
    je EndOfGame
    mov eax,white (black * 16)
    call SetTextColor
    call clrscr 

    ; Drawing the maze
    call DrawMaze

    call DrawPlayer

    call Randomize
    INVOKE PlaySound, OFFSET startSound, NULL,0h

    ;Writing level
    mov eax, green+(black*16)
    call Settextcolor
    mov dh, 10
    mov dl,1
    call Gotoxy
    mov edx, OFFSET level1Prompt
    call WriteString

    GameLoop:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,currentscore
        call WriteInt

        ;draw lives and assuming that 0 lives case has been dealt in last run
        mov dl, 105
        mov dh, 0
        call Gotoxy
        mov edx, OFFSET livesDisplay
        call WriteString
        mov eax, red
        call SetTextColor
        mov al,254
        movzx ecx,lives
        mov edx,OFFSET space
        movzx eax, lives
        call WriteDec
        ;PrintLivesLoop:
         ;   call WriteChar
          ;  call WriteString
        ;loop PrintLivesLoop

        mov eax,white (black * 16)
        call SetTextColor

        ; get user key input:
        movzx eax, timeout
        call Delay
        mov eax,0
        call ReadKey
        cmp eax,1       ;don't know why but my eax is 1 when no key pressed
        je NoKeyPressed

        mov inputChar,al    ;if key is pressed then move it to input char

        NoKeyPressed:    ;keep the previous value of inputChar

        ;now setting players ax,cx for coordinates to check movements
        movzx ax, playerY
        movzx cx,playerX
        mov playerCase,1
        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

                                                    ;PausedScreen
        cmp inputChar,"p"
        jne not_paused
        call Paused

        mov dh,0
        mov dl,30
        call Gotoxy
        mov edx, OFFSET RemovePausedStr
        call WriteString
        mov inputChar,"s"
        jmp gameloop

        not_paused:
        cmp inputChar,"w"
        je MoveUp

        cmp inputChar,"s"
        je MoveDown

        cmp inputChar,"a"
        je MoveLeft

        cmp inputChar,"d"
        je MoveRight

        MoveUp: 

        dec ax
        call moveValid
        cmp isvalid,1
        jne skip_move

        ; allow player to jump:
        mov ecx,1
        jumpLoop:
            call UpdatePlayer
            dec playerY
            call DrawPlayer
            mov eax,70
            call Delay
        loop jumpLoop
        jmp skip_move   ;not actually skipping but going for another check

        MoveDown:

        inc ax
        call moveValid
        cmp isvalid,1
        jne skip_move   

        call UpdatePlayer
        inc playerY
        call DrawPlayer
        jmp skip_move   ;not actually skipping but going for another check

        MoveLeft:

        dec cx
        call moveValid
        cmp isvalid,1
        jne skip_move

        call UpdatePlayer
        dec playerX
        call DrawPlayer
        jmp skip_move   ;not actually skipping but going for another check

        MoveRight:

        inc cx
        call moveValid
        cmp isvalid,1
        jne skip_move

        call UpdatePlayer
        inc playerX
        call DrawPlayer
        jmp skip_move   ;not actually skipping but going for another check

        skip_move:

        ;GETTING POINTS:
        cmp isEatingCoin,1      ;this flag is already set while checking movements
        jne notCollectingCoin

        ; player is intersecting coin:
        inc currentscore
        dec num_coins

        INVOKE PlaySound, OFFSET eatCoinSound, NULL,11h

        jmp EatingChecked
        notCollectingCoin:
        cmp isEatingCoin,2
        jne EatingChecked

        ;player is intersecting fruit
        INVOKE PlaySound, OFFSET eatFruitSound, NULL,11h
        mov al,currentscore
        add al,5
        mov currentscore,al

        EatingChecked:

        cmp num_coins,0
        jle LevelEnd

        ;NOW DOING THE GHOST FEATURES
        call GhostCollision
        call MoveGhost
        call GhostCollision
        cmp level,1
        je DontBeFast
        call MoveGhost
        call GhostCollision
        DontBeFast:

        cmp lives,0
        je exitGame
    jmp GameLoop

    LevelEnd:
    ;jmp exitGame    ;temporary to force stop after 1 level
    inc level
        mov eax,white (black * 16)
        call SetTextColor

    call clrscr
    cmp level, 3
    jg exitGame     ;all levels have ended

    call InitializeLevel
    jmp gameloop

    exitGame:
        call Savetofile
        mov eax,white (black * 16)
        call SetTextColor
        call clrscr
        call GameOver

EndOfGame:
exit
main ENDP

;GAME FUNCTIONS

InitializeLevel PROC
    call ResetPlayer
    call ResetGhost

    cmp level,2
    jne InitializationDone

    mov currentMaze,offset mazearray2
    mov lives,3
    mov num_coins,41

    mov ghost1timerRange,5

    call GenerateFruit
    call DrawMaze

    mov eax, green+(black*16)
    call Settextcolor
    mov dh, 10
    mov dl,1
    call Gotoxy
    mov edx, OFFSET level2Prompt
    call WriteString

    InitializationDone:

ret
InitializeLevel ENDP

GenerateFruit PROC
;yet to complete
ret
GenerateFruit ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,brown +(brown*16)
    call SetTextColor
    mov dl,playerX
    mov dh,playerY
    call Gotoxy
    mov al,"O"
    call WriteChar
ret
DrawPlayer ENDP

UpdatePlayer PROC
    mov dl,playerX
    mov dh,playerY
    call Gotoxy
    mov al," "
    call WriteChar
ret
UpdatePlayer ENDP

ResetPlayer PROC
    call UpdatePlayer
    mov playerX,22
    mov playerY,15
    call DrawPlayer
ret
ResetPlayer ENDP

DrawGhost PROC
    ; draw ghost at (xPos,yPos):
    mov eax,red +(red*16)
    call SetTextColor
    mov dl,ghost1X
    mov dh,ghost1Y
    call Gotoxy
    movzx eax, ghost1Y
    movzx ecx, ghost1X

    mov al,"M"
    call WriteChar
ret
DrawGhost ENDP

UpdateGhost PROC
    mov eax,blue +(black*16)    ;blue incase replacement with coin is needed
    call SetTextColor
    mov dl,ghost1X
    mov dh,ghost1Y
    call Gotoxy
    cmp ghostEatCoin, 0
    je prevIsSpace
    mov al,'*'
    jmp GhostPrevChar

    prevIsSpace:
    mov al," "

    GhostPrevChar:
    call WriteChar
ret
UpdateGhost ENDP

ResetGhost PROC
call UpdateGhost
mov ghost1X, 60
mov ghost1Y, 28
call DrawGhost

ret
ResetGhost ENDP

GhostCollision PROC
    mov al, playerX
    mov ah, playerY

    cmp al, ghost1X
    jne notEaten

    cmp ah, ghost1Y
    jne notEaten

    ;if still not return then player is being eaten by ghost
    INVOKE PlaySound, OFFSET killedSound, NULL, 0h
    dec lives
    call ResetPlayer

    notEaten:
ret 
GhostCollision ENDP

MoveGhost PROC
    cmp ghost1timer,0
    jg skipDirectionChg
    call CalcGhostDirection
    mov al,ghost1timerRange
    mov ghost1timer,al  ;delay before recalculating direction

    skipDirectionChg:

    ;adding complexity to ghost movement for level 2
    cmp level,1
    je skipRandom

    mov minRange,0
    mov maxRange,100
    call GenerateRandom
    cmp al,85
    jl skipRandom

    ;move the ghost in any random direction
    call GhostRandomMovement
    mov ghost1Direction, al

    skipRandom:

        ;now setting ghost ax,cx for coordinates to check movements
        movzx ax, ghost1Y
        movzx cx, ghost1X
        mov playerCase,0       ;checking that ghost does not eat coin
    CheckGhostMovementDirection:

    cmp ghost1Direction,"w"
    je MoveGhostUp

    cmp ghost1Direction,"s"
    je MoveGhostDown

    cmp ghost1Direction,"a"
    je MoveGhostLeft

    cmp ghost1Direction,"d"
    je MoveGhostRight

    MoveGhostUp:
    mov ghost1Direction,"w"     ;for the loop after invalid move

        mov temp_ax,ax
        mov temp_cx,cx
    dec ax
    call moveValid
        mov ax,temp_ax
        mov cx,temp_cx
    cmp isvalid,1

    jne skipGhostmove

        call UpdateGhost
        dec ghost1Y
        call DrawGhost
        mov eax,70
    jmp DoneGhostmove   ;not actually skipping but going for another check

    MoveGhostDown:
    mov ghost1Direction,"s"     ;for the loop after invalid move

        mov temp_ax,ax
        mov temp_cx,cx
    inc ax
    call moveValid
        mov ax,temp_ax
        mov cx,temp_cx
    cmp isvalid,1
    jne skipGhostmove   

    call UpdateGhost
    inc ghost1Y
    call DrawGhost
    jmp DoneGhostmove   ;not actually skipping but going for another check

    MoveGhostLeft:
    mov ghost1Direction,"a"     ;for the loop after invalid move

        mov temp_ax,ax
        mov temp_cx,cx
    dec cx
    call moveValid
        mov ax,temp_ax
        mov cx,temp_cx
    cmp isvalid,1
    jne skipGhostmove

    call UpdateGhost
    dec ghost1X
    call DrawGhost
    jmp DoneGhostmove   ;not actually skipping but going for another check

    MoveGhostRight:
    mov ghost1Direction,"d"     ;for the loop after invalid move
    cmp ghost1X,99
    jge skipGhostmove

        mov temp_ax,ax
        mov temp_cx,cx
    inc cx
    call moveValid
        mov ax,temp_ax
        mov cx,temp_cx
    cmp isvalid,1
    jne skipGhostmove

    call UpdateGhost
    inc ghost1X
    call DrawGhost
    jmp DoneGhostmove   ;not actually skipping but going for another check

    skipGhostmove:  ;the current ghost move was invalid
    
    call GhostSwapDirection     ;swaps the dominant and non-dominant direction

    DoneGhostmove:
    dec ghost1timer
ret
MoveGhost ENDP

GhostRandomMovement PROC
ret
    call GhostSwapDirection

    mov MinRange, 1 
    mov MaxRange, 5
    call GenerateRandom

    cmp ebx, 1
    je randomUp
    cmp ebx, 2
    je randomDown
    cmp ebx, 3
    je randomLeft
    cmp ebx, 4
    je randomRight

randomUp:
    mov eax, "w"
    ret

randomDown:
    mov eax, "s"
    ret

randomLeft:
    mov eax, "a"
    ret

randomRight:
    mov eax, "d"
    ret

GhostRandomMovement ENDP

GenerateRandom PROC
    
    mov temp_eax,eax;
    call Randomize  ;initialize the random generator

    movzx eax, maxRange
    movzx ebx, minRange 
    sub eax,ebx
    call RandomRange 
    add eax,ebx
    mov ebx,eax         ;returning result in ebx
    mov eax,temp_eax     ;restoring eax original value
ret
GenerateRandom ENDP

GhostSwapDirection PROC
    mov al, ghost1NextDirection
    mov ah, ghost1Direction
    mov ghost1Direction, al
    mov ghost1NextDirection, ah    
ret
GhostSwapDirection ENDP

CalcGhostDirection PROC
    mov bl,ghost1Direction
    mov bh,ghost1NextDirection

    mov al,playerX
    mov ah,playerY

    sub al,ghost1X
    sub ah,ghost1Y

    cmp al,0
    ;je GhostXCalculated     ;skip
    jg moveGhostRight
    mov bl, "a"
    jmp GhostXCalculated

    moveGhostRight:
    mov bl, "d"

    GhostXCalculated:

    cmp ah,0
    ;je GhostYCalculated     ;skip
    jg moveGhostDown
    mov bh, "w"
    jmp GhostYCalculated

    moveGhostDown:
    mov bh, "s"

    GhostYCalculated:

    ;Finally check whether x difference is greater or y difference
    ; Calculate the value of ah - al and store it in cx
    mov cl, ah
    sub cl, al

    ; Compare the absolute values of ah and al
    cmp cl, 0
    jge YdifGreater  ;ah is bigger
    mov ghost1Direction, bl
    mov ghost1NextDirection, bh
    ret

    YdifGreater:
    mov ghost1Direction, bh
    mov ghost1NextDirection, bl

ret
CalcGhostDirection ENDP

DrawMaze PROC
    
    ;BOTTOM BOUNDARY
    ; draw ground at (0,28):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    ;TOP BOUNDARY
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    ;LEFT BOUNDARY
    mov ecx,29
    mov dh,0
    mov temp,dh
    l1:
    mov dh,temp
    mov dl,19
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l1

    ;RIGHT BOUNDARY
    mov ecx,29
    mov dh,0
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,100
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2
    
    ;MAZE CREATION
    mov eax, currentMaze ; Set the starting address of the string
    mov dh,2    ;  start at row 2
    mov dl,20   ;  start at col 20
    mov MazeRow,dh
    mov MazeCol,dl

    ; Loop through each row and call WriteString
    mov ecx,27;     27 rows in the maze
    displayLoop:
        call Gotoxy
        mov ebx,ecx;
        mov ecx,80
        mov edx, eax       ; Set the address of the current row
        call WriteString  ; Display the row
        mov ecx,ebx

        add eax, 81        ; Move to the next row (assuming each row is 80 characters wide)

        inc MazeRow
        mov dh,MazeRow
        mov dl,MazeCol
        
    loop displayLoop
ret
DrawMaze ENDP

Page1 PROC
    mov eax,brown (blue * 16)
    call SetTextColor
    call clrscr

    mov ecx,20
    mov row,5
    mov col,0

    mov dh, row
    mov dl,col
    call Gotoxy
    mov edx,offset PacmanName
    call WriteString
    mov dh,14
    mov dl,10
    call Gotoxy
    mov edx,offset PromptGetname
    call WriteString

    mov edx,offset PlayerName
    call ReadString

ret
Page1 ENDP

Menu PROC
    
    ShowMenu:
    call clrscr

    mov dh,4
    mov dl,0
    call Gotoxy

    mov ecx,100
    mov edx,offset MenuOptions
    call writeString

    call ReadChar
    mov menuInput, al
    cmp al, '1'
    je ExitMenu

    cmp al, '2'
    jne ExitMenu

    call Instructions
    jmp ShowMenu

    ExitMenu:
ret
Menu ENDP

Instructions PROC
    call clrscr

    mov dh,10
    mov dl,0
    call Gotoxy

    mov ecx,100
    mov edx,offset InstructionsScreen
    call writeString

    call ReadChar
ret
Instructions ENDP

Paused PROC
mov dh,0
mov dl,30
call Gotoxy
mov edx, OFFSET PausedStr
call WriteString
call ReadChar
ret
Paused ENDP

GameOver PROC
    mov dh,10
    mov dl,0
    call Gotoxy
    
    mov ecx,100
    mov edx,OFFSET GameOverPrompt
    call WriteString

    mov ecx,30
    mov edx, OFFSET PlayerName
    call writestring

    mov dh,14
    mov dl,20
    call Gotoxy
    movzx eax, currentscore
    call writeDec

    mov dh,13
    mov dl,0
    call Gotoxy

    call ReadChar   ;to wait

ret
GameOver ENDP

moveValid PROC;     takes row(ax) and col(cx) variables as parameter and returns whether the space is available to move
    mov isvalid,1       ; initial value
    mov isEatingCoin,0      ;by default not eating

    jmp boundary_checks

    boundary_not_ok:
    mov isvalid,0
    mov isEatingCoin,0
    ret

    boundary_checks:

    cmp ax,1
    jle boundary_not_ok
    cmp ax,29
    jge boundary_not_ok

    cmp cx,19
    jle boundary_not_ok
    cmp cx,100
    jge boundary_not_ok

    ;if reacheached here then boundary is ok

    cmp playerCase,1
    je check_for_player
    mov ghostEatCoin,0

    check_for_player:

    sub ax,2      ;because maze starts at 2 row
    sub cx,20     ;because maze starts at 20 col

    mov bx,81
    mul bx
    ;now ax contains the correct row

    add ax,cx
    ;ax now contains the exact index to be checked

    mov edx,currentMaze
    add edx,eax

    mov bl,[edx]
    cmp bl,"#"
    jne free_to_move
    mov isvalid,0
    ret

    free_to_move:
    cmp bl,coinChar
    jne NotEatingCoin
    mov isEatingCoin,1  ;means that dot and pacman intersect
    cmp playerCase,1
    je player_eat_coin

    mov ghostEatCoin,1
    mov isEatingCoin,0  ;if ghost eats the coin then it is not counted

    ret

    player_eat_coin:
    mov al, ' ' 
    mov [edx], al      ;replacing the player eaten coin in the actual maze as well

    ret

    NotEatingCoin:
        cmp playerCase,1
    jne NotEatingFruit

    cmp bl,"$"
    jne NotEatingFruit

    cmp level,1
    je NotEatingFruit

    mov isEatingCoin,2  ;means that fruit and pacman intersect
    mov al, ' ' 
    mov [edx], al      ;replacing the player eaten coin in the actual maze as well

    NotEatingFruit:

ret
moveValid ENDP

END main