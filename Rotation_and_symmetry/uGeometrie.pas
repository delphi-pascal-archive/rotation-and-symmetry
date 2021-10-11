unit uGeometrie;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfGeometrie = class(TForm)
    Panel1: TPanel;
    pb: TPaintBox;
    procedure pbPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    O: tPoint; // origine des axes
    procedure DessinePoint(O: tPoint; cl: TColor; t: string);
    procedure DessineAxes;
    procedure EncadrerTexte(Titre: string);
  end;

var
  fGeometrie: TfGeometrie;

implementation

{$R *.DFM}
uses Math;

procedure RotaPoint(Centre: tPoint; var Pt: tPoint; dPhiRad: Extended); // dPhiRad = Angle de rotation en Radians
var Rxx, Ryy: Double; si, co: Extended;
begin
  Rxx := Pt.x - Centre.x; Ryy := Pt.y - Centre.y;
  // Application de la matrice de rotation par rapport au centre xc,yc
  SinCos(dPhiRad, si, co);
  Pt.x := round(Centre.x + (Rxx * co - Ryy * si));
  Pt.y := round(Centre.y + (Rxx * si + Ryy * co));
end;

procedure Symetrie(Centre: tPoint; var Pt: tPoint); // Centre de rotation
begin
  Pt.x := round(2*Centre.x - Pt.x);
  Pt.y := round(2*Centre.y - Pt.y);
end;

procedure SymetrieV(Centre: tPoint; var Pt: tPoint); // Centre : Axe vertical
begin
//  Pt.x := Pt.x;
  Pt.y := round(2*Centre.y - Pt.y);
end;

procedure SymetrieH(Centre: tPoint; var Pt: tPoint); // Centre : Axe horizontal
begin
  Pt.x := round(2*Centre.x - Pt.x);
//  Pt.y := round(2*Centre.y - Pt.y);
end;

procedure TfGeometrie.FormCreate(Sender: TObject);
begin
 // ClientWidth:=460;  ClientHeight:=460;
end;

procedure TfGeometrie.DessinePoint(O: tPoint; cl: TColor; t: string);
begin
  with PB.Canvas do
  begin
    Pen.Width:=2;
    Pen.Color:=cl;
    Moveto(O.X-4,O.Y-4);  Lineto(O.X+4,O.Y+4);
    Moveto(O.X+4,O.Y-4);  Lineto(O.X-4,O.Y+4);
    Font.size:=12;
    Font.Style:=[fsBold];
    TextOut(O.X+6,O.Y-12, t);
  end
end;

procedure TfGeometrie.DessineAxes;
var i: integer;
begin
  // Dessiner les 2 axes : unité = 20
  with pb,Canvas do
  begin
    Pen.Color:=clMaroon;
    Pen.Width:=2;
    Pen.Style:=psSolid;

  // Dessiner l'origine
    O:=Point(ClientWidth div 2, 15 + ClientHeight div 2);
    DessinePoint(O, clPurple, 'O');

  // Dessiner les axes
    Pen.Color:=clBlack;
    Pen.Width:=1;
    MoveTo(O.x-200,O.y); LineTo(O.x+200,O.y);
    MoveTo(O.x,O.y-200); LineTo(O.x,O.y+200);

    for i:=-10 to 10 do
    begin
     // Cadrillage
     Pen.Width:=1; Pen.Style:=psDot;
     MoveTo(O.x-200,O.y-20*i); LineTo(O.x+200,O.y-20*i);
     MoveTo(O.x-20*i,O.y-200); LineTo(O.x-20*i,O.y+200);

     // les 2 axes
     Pen.Width:=1; Pen.Style:=psSolid;
     MoveTo(O.x-200,O.y); LineTo(O.x+200,O.y);
     MoveTo(O.x,O.y-200); LineTo(O.x,O.y+200);

    // Dessiner les graduations
     MoveTo(O.x-20*i,O.y-2); LineTo(O.x-20*i,O.y+2);
     MoveTo(O.x-2,O.y-20*i); LineTo(O.x+2,O.y-20*i);
    end;
  end;
end;

procedure TfGeometrie.EncadrerTexte(Titre: string);
var
  X, Y, w: integer;
  TheRect: TRect;
begin
  with pb.Canvas do
  begin
    w:=TextWidth(Titre); // largeur titre
    X := O.x - w div 2;   Y := 10;              // O est l'origine
    Pen.Color := 4;
    Pen.Style := psSolid;
    Brush.Color := 44444;
    Brush.Style := bsSolid;
    TheRect := Rect(X, Y, X+w, Y+30);  // Définir cadre pour titre
    Rectangle(TheRect);  // Dessiner Cadre
    InflateRect(TheRect,-1,-1);  // Agrandir cadre de 1 pixel
    TextRect(TheRect, X, Y, Titre);
  end
end;

procedure TfGeometrie.pbPaint(Sender: TObject);
var
  i, b : integer;
  dPhiRad : real;
  Points: array of TPoint;
begin
  with PB.Canvas do
  begin
    DessineAxes;
    // Dessiner Titre
    EncadrerTexte(' Rotation and symmetry ');

  // Dessiner le triangle initial
    SetLength(Points, 3);
    Points[0] := Point(105, 90);
    Points[1] := Point(190, 90);
    Points[2] := Point(150, 130);

    Pen.Width := 2;
    Pen.Color := clBlack;
    Brush.Color := clPurple; 
    Polygon(Points);

  // Dessiner la symétrie // O
    Pen.Color := clblue;
    Pen.Style:= psInsideFrame;

    for i:=0 to high(Points) do
      Symetrie(O, Points[i]);
    Polygon(Points);

    Points[0] := Point(105, 90);
    Points[1] := Point(190, 90);
    Points[2] := Point(150, 130);

  // Dessiner la symétrie verticale
    Pen.Color := clGreen;
    for i:=0 to high(Points) do
      SymetrieV(O, Points[i]);
    Polygon(Points);

    Points[0] := Point(105, 90);
    Points[1] := Point(190, 90);
    Points[2] := Point(150, 130);

  // Dessiner la symétrie horizontale
    Pen.Color := clRed;
    for i:=0 to high(Points) do
      SymetrieH(O, Points[i]);
    Polygon(Points);

  // Effectuer des rotations autour de O
    Pen.Color := clYellow;
    Brush.Color := clgray;
    dPhiRad:=0;
    for b:=0 to 2 do
    begin
      Points[0] := Point(105, 90);
      Points[1] := Point(190, 90);
      Points[2] := Point(150, 130);

      dPhiRad:=dPhiRad+0.5;
      for i:=0 to high(Points) do
       RotaPoint(O, Points[i], dPhiRad);
      Polygon(Points);
    end;
  end;
end;

end.
