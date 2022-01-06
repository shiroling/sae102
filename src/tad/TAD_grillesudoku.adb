pragma Ada_2012;


with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
   grille : Type_Grille;
   begin
      grille :=  ((others=>0),(others=>0),(others=>0),
                  (others=>0),(others=>0),(others=>0),
                  (others=>0),(others=>0),(others=>0));
      return grille;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide (g : in Type_Grille; c : in Type_Coordonnee)
                        return Boolean is
   begin
      if g(obtenirLigne(c),obtenirColonne(c))=0 then
         return true;
      else
         return False;
      end if;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre (g : in Type_Grille; c : in Type_Coordonnee)
                            return Integer is
   begin
         if g(obtenirLigne(c),obtenirColonne(c))=0 then
            raise OBTENIR_CHIFFRE_NUL;
         else
         return g(obtenirLigne(c),obtenirColonne(c));
      end if;
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      c : Type_Coordonnee;
      colonne : integer := 1;
      ligne : integer := 1;
      cp :integer := 0;
   begin
      for i in 1..9 loop
         for j in 1..9 loop
            c := construireCoordonnees(i, j);
            if not caseVide(g, c) then
               cp := cp+1;
            end if;
         end loop;
      end loop;
      return cp;
   end nombreChiffres;


   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer) is
   begin
      if g(obtenirLigne(c),obtenirColonne(c))/=0 then
         raise FIXER_CHIFFRE_NON_NUL;
      else
         g(obtenirLigne(c),obtenirColonne(c)):=v;
      end if;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if g(obtenirLigne(c),obtenirColonne(c))=0 then
         raise VIDER_CASE_VIDE;
      else
         g(obtenirLigne(c),obtenirColonne(c)):=0;
      end if;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      if nombreChiffres(g) = 81 then
         return true;
      else
         return false;
         end if;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------
   --obtenirChiffre (g : in Type_Grille; c : in Type_Coordonnee)
   function obtenirChiffresDUneLigne (g : in Type_Grille; numLigne : in Integer)
                                      return Type_Ensemble is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;

      for i in 1 .. 9 loop
         if not caseVide(g, construireCoordonnees(numLigne, i)) then
            ajouterChiffre(e, g(numLigne, i));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne(g : in Type_Grille; numColonne : in Integer) return Type_Ensemble is
      e : Type_Ensemble;
   begin
      e:= construireEnsemble;
      for i in 1 .. 9 loop
         if not caseVide(g, construireCoordonnees(i, numColonne)) then
            ajouterChiffre(e, g(i, numColonne));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble is
      cord: Type_Coordonnee;
      e : Type_Ensemble;
   begin
      e:= construireEnsemble;
      cord := obtenirCoordonneeCarre(numCarre);
      for i in 0 .. 2 loop
         for j in 0 .. 2 loop
            if not caseVide(g, construireCoordonnees(
                            i + obtenirLigne(cord), j + obtenirColonne(cord))) then
               ajouterChiffre(e, g(i + obtenirLigne(cord), j + obtenirColonne(cord)));
            end if;
         end loop;
      end loop;
      return e;
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
