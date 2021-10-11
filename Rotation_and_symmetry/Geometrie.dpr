{
Rotation et Symétrie:
Programmé par Martin AJARD.
2015-01-06 Création
===============================================================================
Ceci est un embryon de projet montrant les aspects de dessin sur un canvas :
il dessine un triangle
puis effectue des rotations autour du centre O
puis des symétries verticale, horizontale et par rapport à O

Ca pourrait donner des idées à des apprentis.

si ce source vous est utile,
si vous avez des remarques à faire la-dessus,
si vous apportez des améliorations,
Faites-le savoir en m'écrivant un message
}


{ Style	Signification

  psSolid	Une ligne continue
  psDash	Une ligne constituée d'une série de tirets
  psDot	Une ligne constituée d'une série de points
  psDashDot	Une ligne constituée d'une alternance de tirets et de points
  psDashDotDot	Une ligne constituée d'une série de séquences tiret-point-point
  psClear	Pas de ligne dessinée (style utilisé pour ne pas dessiner la ligne autour de formes dont le contour est dessiné par le crayon en cours)
  psInsideFrame	Une ligne continue pouvant utiliser une couleur mélangée si Width est supérieure à 1

  Remarque :	Seul le style psInsideFrame peut produire une couleur mélangée afin de correspondre à une valeur de la propriété Color ne se trouvant pas dans la table des couleurs. Les autres styles choisissent la couleur la plus proche dans la table des couleurs Windows.
  Remarque :	Les styles de crayon en pointillés ou en tirets ne sont utilisables que si la propriété Width a la valeur 1.
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
