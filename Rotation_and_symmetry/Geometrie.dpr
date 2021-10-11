{
Rotation et Sym�trie:
Programm� par Martin AJARD.
2015-01-06 Cr�ation
===============================================================================
Ceci est un embryon de projet montrant les aspects de dessin sur un canvas :
il dessine un triangle
puis effectue des rotations autour du centre O
puis des sym�tries verticale, horizontale et par rapport � O

Ca pourrait donner des id�es � des apprentis.

si ce source vous est utile,
si vous avez des remarques � faire la-dessus,
si vous apportez des am�liorations,
Faites-le savoir en m'�crivant un message
}


{ Style	Signification

  psSolid	Une ligne continue
  psDash	Une ligne constitu�e d'une s�rie de tirets
  psDot	Une ligne constitu�e d'une s�rie de points
  psDashDot	Une ligne constitu�e d'une alternance de tirets et de points
  psDashDotDot	Une ligne constitu�e d'une s�rie de s�quences tiret-point-point
  psClear	Pas de ligne dessin�e (style utilis� pour ne pas dessiner la ligne autour de formes dont le contour est dessin� par le crayon en cours)
  psInsideFrame	Une ligne continue pouvant utiliser une couleur m�lang�e si Width est sup�rieure � 1

  Remarque�:	Seul le style psInsideFrame peut produire une couleur m�lang�e afin de correspondre � une valeur de la propri�t� Color ne se trouvant pas dans la table des couleurs. Les autres styles choisissent la couleur la plus proche dans la table des couleurs Windows.
  Remarque�:	Les styles de crayon en pointill�s ou en tirets ne sont utilisables que si la propri�t� Width a la valeur 1.
}


program Geometrie;

uses
  Forms,
  uGeometrie in 'uGeometrie.pas' {fGeometrie};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfGeometrie, fGeometrie);
  Application.Run;
end.
