pragma Ada_2012;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
   g : Type_Grille;
   begin
      g :=  ((others=>0),(others=>0),(others=>0),
                  (others=>0),(others=>0),(others=>0),
                  (others=>0),(others=>0),(others=>0));
      return g;
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
         return flase;
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
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      c : Type_Coordonnee := (1,1);
      cp := 0;
   begin
       while obtenirLigne(c)<=9 loop
           while obtenirColonne(c)<=9 loop
               if caseVide(g,c)=false loop
                   cp := cp =1;
               end if;
               obtenirColonne(c):=obtenirColonne+1;
           end loop;
           obtenirLigne(c):=obtenirLigne(c)+1;
           obtenirColonne:=0;
       end loop;
       return cp;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer) is
   begin
      if g(obtenirLigne(c),obtenirColonne(c))=0 then
         raise FIXER_CHIFFRE_NON_NUL;
      else
         g(obtenirLigne(c),obtenirColonne(c)):=v;
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
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne (g : in Type_Grille; numLigne : in Integer) 
                                       return Type_Ensemble is
   begin
      for i in 1 .. 9 loop
         if g(numLigne, i) /= 0 then
            ajouterChiffre(g(numLigne, i);
         end if;
      end loop;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble is
      begin
         for i in 1 .. 9 loop
            if g(i, numLigne) /= 0 then
               ajouterChiffre(g(i, numLigne);
            end if;
         end loop;
      end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble is
      cord: Type_Coordonnee;
   
   begin
      cord := obtenirCoordonneeCarre(numCarre);
      for i in 0 .. 2 loop
         for j in 0 .. 0 loop
            if g(i + cord.linge, j +) /= 0 then
               ajouterChiffre(g(i, numLigne);
         end loop;
      end loop;
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
