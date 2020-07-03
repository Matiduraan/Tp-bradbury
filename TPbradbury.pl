/*Base de conocimiento*/

viveEnLaCasa(agatha).
viveEnLaCasa(carnicero).
viveEnLaCasa(charles).

odia(agatha,Persona):-
    viveEnLaCasa(Persona),
    Persona \= carnicero.
odia(carnicero,Persona):-
    viveEnLaCasa(Persona),
    odia(agatha,Persona).
odia(charles,Persona):-
    viveEnLaCasa(Persona),
    not(odia(agatha,Persona)).

esMasRicoQueAgatha(Persona):-
    not(odia(carnicero,Persona)),
    viveEnLaCasa(Persona).

mataAAgatha(Persona):-
    viveEnLaCasa(Persona),
    odia(Persona,agatha),
    not(esMasRicoQueAgatha(Persona)).


/* Consultas:

?- mataAAgatha(Persona).
Persona = agatha ;
Persona = carnicero ;

?- odia(_,milhouse).
false.

?- odia(charles,Persona).
Persona = charles.

?- odia(Persona,agatha).
Persona = agatha ;
Persona = carnicero ;

?- odia(Odiador,Odiado).
Odiador = Odiado, Odiado = agatha ;
Odiador = agatha, Odiado = carnicero ;
Odiador = carnicero, Odiado = agatha ;
Odiador = Odiado, Odiado = carnicero ;
Odiador = Odiado, Odiado = charles.


?- odia(carnicero,_).
true 
*/
