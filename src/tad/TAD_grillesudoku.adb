pragma Ada_2012;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "construireGrille unimplemented");
      return
        raise Program_Error with "Unimplemented function construireGrille";
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "caseVide unimplemented");
      return raise Program_Error with "Unimplemented function caseVide";
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirChiffre unimplemented");
      return raise Program_Error with "Unimplemented function obtenirChiffre";
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "nombreChiffres unimplemented");
      return raise Program_Error with "Unimplemented function nombreChiffres";
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "fixerChiffre unimplemented");
      raise Program_Error with "Unimplemented procedure fixerChiffre";
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      pragma Compile_Time_Warning (Standard.True, "viderCase unimplemented");
      raise Program_Error with "Unimplemented procedure viderCase";
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      pragma Compile_Time_Warning (Standard.True, "estRemplie unimplemented");
      return raise Program_Error with "Unimplemented function estRemplie";
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirChiffresDUneLigne unimplemented");
      return
        raise Program_Error
          with "Unimplemented function obtenirChiffresDUneLigne";
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirChiffresDUneColonne unimplemented");
      return
        raise Program_Error
          with "Unimplemented function obtenirChiffresDUneColonne";
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirChiffresDUnCarre unimplemented");
      return
        raise Program_Error
          with "Unimplemented function obtenirChiffresDUnCarre";
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
