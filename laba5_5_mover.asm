        org 100h
start:
        ; âûâîä òåêñòîâîãî ññîîáùåíèÿ
        mov ah, 9h
        mov     dx,txt
        int     21h

        mov     cx,05h ; ÷èñëî ïåðåñûëàåìûõ ý-íòîâ çàãðóæàåòñÿ â ñõ.
        mov     si,string1+15   ; â ðåãèñòðå SI àäðåñ ñòðîêè, îòêóäà êîïèðóåì áàéòû
        mov     di,string2+15  ; â ðåãèñòðå DI àäðåñ ñòðîêè, êóäà êîïèðóåì áàéòû
        cld     ; ñáðàñûâàåì ôëàã íàïðàâëåíèÿ-df = 0,ðåãèñòðû SI è DI áóäóò óâåëè÷èâàòüñÿ íà 1; îáðàáîòêà áóäåò îñóùåñòâëÿòüñÿ â íàïðàâëåíèè âîçðàñòàíèÿ àäðåñîâ, ò.ê df ñòàíîâèòñÿ = 0
rep     movsb     ; êîïèðóåò áàéò èç si â di ; cx óìåíüøàåòñÿ íà 1

        mov     cx,05h ; ÷èñëî ïåðåñûëàåìûõ ý-íòîâ çàãðóæàåòñÿ â ñõ.
        mov     si,string1+28   ; â ðåãèñòðå SI àäðåñ ñòðîêè, îòêóäà êîïèðóåì áàéòû
        mov     di,string2+28  ; â ðåãèñòðå DI àäðåñ ñòðîêè, êóäà êîïèðóåì áàéòû
        cld     ; ñáðàñûâàåì ôëàã íàïðàâëåíèÿ-df = 0,ðåãèñòðû SI è DI áóäóò óâåëè÷èâàòüñÿ íà 1; îáðàáîòêà áóäåò îñóùåñòâëÿòüñÿ â íàïðàâëåíèè âîçðàñòàíèÿ àäðåñîâ, ò.ê df ñòàíîâèòñÿ = 0
rep     movsb     ; êîïèðóåò áàéò èç si â di ; cx óìåíüøàåòñÿ íà 1

        ; âûâîä íà÷àëüíîé ñòðîêè
        mov ah,9h
        mov dx, string1
        int 21h

        mov ah, 02h
        mov dx, 0x0D0A
        int 21h

        ; âûâîä ïîëó÷åííîé ñòðîêè
        mov ah,9h
        mov dx, string2
        int 21h

        ; âûâîä òåêñòîâîãî ñîîáùåíèÿ
        mov ah, 9h
        mov     dx,exit_str
        int     21h

        mov ah,8h   ;æäàòü íàæàòèÿ ëþáîé êëàâèøè äëÿ âûõîäà èç ïðîãðàììû
        int 21h
        ret

txt     db      "Transfer string example", 0dh, 0ah, '$'
exit_str        db      0dh, 0ah,"To exit now press any button...", 0dh, 0ah, '$'
string1    db      '012345678901234568764532789564321','$'
string2    db      '*********************************',0dh, 0ah, '$'

