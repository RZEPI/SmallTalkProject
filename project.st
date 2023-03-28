Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !

!Wielokat methodsFor: 'actions'!
drukuj
    Transcript cr;
    show: 'Wierzcholki '; show: (self nazwa) ; show:'u to: '; cr.
    1 to: wierzcholki size do: [:x | Transcript show: 'wierzcholek '; show: x printString ;show: ': '; show: (wierzcholki at: x) printString; cr]! !
    
Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared!

skaluj: skala
    | k bok |
    bok:= self pole.
    bok:= bok sqrt.
    bok:= bok*skala.
    k:= (Kwadrat new) initialize: bok.
    ^k!
    
drukuj 
    super drukuj.
    Transcript show: 'Pole tego kwadratu wynosi: '.
    Transcript show: ( self pole asInteger ) printString.
    Transcript cr.!!

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok. ! !
	
Wielokat subclass: #Trapez
    instanceVariableNames: 'wys podTop podBot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!
	
!Trapez methodsFor: 'actions'!

wys 
	^wys!
podTop
    ^podTop!
podBot
    ^podBot!


skaluj: skala
    | t |
	t := (Trapez new) wys: wys*skala podTop: podTop*skala podBot: podBot*skala.
	^t.!

drukuj 
    super drukuj.
    Transcript show: 'Pole tego trapezu wynosi: '.
    Transcript show: ( self pole asInteger ) printString.
    Transcript cr.!!

!Trapez methodsFor: 'arithmetic'!
+ figura
	| p part wysN podTopN podBotN t | 
	p := self pole.
	p := p + figura pole.
	p := 2*p.
	wysN:= self wys.
	p := p/wysN.
	part := p/10.
	podTopN := part*4.
	podBotN := part*6.
	t:= (Trapez new) wys: wysN podTop: podTopN podBot: podBotN.
	^t.!
	
pole
	| p podstawy |
    podstawy:= self podTop.
    podstawy:= podstawy + self podBot.
	p:= (podstawy* self wys)/2.
	^p.! !


!Trapez methodsFor:'initialize-release'!
wys: wys1 podTop: podTop1 podBot: podBot1
    wys:= wys1.
    podTop:= podTop1.
    podBot:= podBot1.
	super initialize:4 name: 'Trapez'.
	wierzcholki at: 2 put: podTop@0.
	wierzcholki at: 3 put: podBot@wys.
	wierzcholki at: 4 put: 0@wys.! !

" -=-=-=-=-=-=- Część testowa -=-=-=-=-=-=- "

Transcript cr.
Transcript show: 'Kwadrat:'.
k:= (Kwadrat new) initialize: 10.
k drukuj.
Transcript cr.
Transcript show: 'Trapez:'.

t:= (Trapez new) wys: 2 podTop: 4 podBot: 6.
t drukuj.
Transcript cr.
Transcript show: 'Trapez po przeskalowaniu:'.

t1:= t skaluj: 3.
t1 drukuj.
Transcript cr.
Transcript show: 'Kwadrat po przeskalowaniu:'.

k1:= k skaluj: 2.
k1 drukuj.
Transcript cr.
Transcript show: 'Trapez po dodaniu pol dwoch poprzednich figur:'.
t2:= t1 + k1.
t2 drukuj.

Transcript cr.
Transcript show: 'Trapez po dodaniu pol dwoch poprzednich figur:'.

k2:= k1 + t1.
k2 drukuj.
