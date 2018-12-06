%Uma série de TV tem como personagens um Mocinho, um Bandido, uma
% Mocinha e uma Invejosa.
serie(_) :- mocinho(_), mocinha(_), bandido(_), invejosa(_).

% Todo personagem é ou estudante, ou trabalha numa lanchonete ou é
% empresário.
personagem(X) :- profissao(X,empresario);profissao(X,lanchonete);profissao(X,estudante).

%O mocinho é sempre Clark.
% O mocinho é apaixonado pela Mocinha e a Invejosa é apaixonada pelo
% mocinho.
mocinho(clark).
mocinho(X) :- mocinha(Y), apaixonado(X,Y), invejosa(Z), apaixonado(Z,X).

mocinha(X) :- mocinho(Y), apaixonado(Y,X).

%Invejosa chantageia o bandido.
invejosa(X) :- bandido(Y), chantageia(X,Y).

%O bandido é o irmão perdido do mocinho.
%O bandido é sempre um empresário que é apaixonado pela Mocinha.
bandido(X) :- profissao(X,empresario), mocinho(Y), apaixonado(X,Y), mocinho(Z), irmao_perdido(X,Z).

%Lex é empresário, Lana e Chloé são estudantes e Clark trabalha numa lanchonete.
profissao(lex,empresario).
profissao(lana,estudante).
profissao(chloé, estudante).
profissao(clark, lanchonete).

%Todos os apaixonados por Lana, com exceção de Clark, são irmãos perdidos de Clark.
irmao_perdido(X,clark) :- apaixonado(X,lana), \+(X=clark).

%Harry, Clark e Lex são apaixonados por Lana.
apaixonado(harry,lana).
apaixonado(clark,lana).
apaixonado(lex,lana).

%Chloé é apaixonada por Clark.
apaixonado(chloe,clark).

%Chloé chantageia todos os empresários que são apaixonados por Lana.
chantageia(chloe,X) :- profissao(X,empresario), apaixonado(X,lana).
