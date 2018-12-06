%Uma s�rie de TV tem como personagens um Mocinho, um Bandido, uma
% Mocinha e uma Invejosa.
serie(_) :- mocinho(_), mocinha(_), bandido(_), invejosa(_).

% Todo personagem � ou estudante, ou trabalha numa lanchonete ou �
% empres�rio.
personagem(X) :- profissao(X,empresario);profissao(X,lanchonete);profissao(X,estudante).

%O mocinho � sempre Clark.
% O mocinho � apaixonado pela Mocinha e a Invejosa � apaixonada pelo
% mocinho.
mocinho(clark).
mocinho(X) :- mocinha(Y), apaixonado(X,Y), invejosa(Z), apaixonado(Z,X).

mocinha(X) :- mocinho(Y), apaixonado(Y,X).

%Invejosa chantageia o bandido.
invejosa(X) :- bandido(Y), chantageia(X,Y).

%O bandido � o irm�o perdido do mocinho.
%O bandido � sempre um empres�rio que � apaixonado pela Mocinha.
bandido(X) :- profissao(X,empresario), mocinho(Y), apaixonado(X,Y), mocinho(Z), irmao_perdido(X,Z).

%Lex � empres�rio, Lana e Chlo� s�o estudantes e Clark trabalha numa lanchonete.
profissao(lex,empresario).
profissao(lana,estudante).
profissao(chlo�, estudante).
profissao(clark, lanchonete).

%Todos os apaixonados por Lana, com exce��o de Clark, s�o irm�os perdidos de Clark.
irmao_perdido(X,clark) :- apaixonado(X,lana), \+(X=clark).

%Harry, Clark e Lex s�o apaixonados por Lana.
apaixonado(harry,lana).
apaixonado(clark,lana).
apaixonado(lex,lana).

%Chlo� � apaixonada por Clark.
apaixonado(chloe,clark).

%Chlo� chantageia todos os empres�rios que s�o apaixonados por Lana.
chantageia(chloe,X) :- profissao(X,empresario), apaixonado(X,lana).
