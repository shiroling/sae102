pragma Ada_2012;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "estChiffreValable unimplemented");
      return
        raise Program_Error with "Unimplemented function estChiffreValable";
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirSolutionsPossibles unimplemented");
      return
        raise Program_Error
          with "Unimplemented function obtenirSolutionsPossibles";
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "rechercherSolutionUniqueDansEnsemble unimplemented");
      return
        raise Program_Error
          with "Unimplemented function rechercherSolutionUniqueDansEnsemble";
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "resoudreSudoku unimplemented");
      raise Program_Error with "Unimplemented procedure resoudreSudoku";
   end resoudreSudoku;

end resolutions;
