with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with affichage;        use affichage;
with ada.Text_IO;       use ada.Text_IO;
with ada.Integer_Text_IO;       use ada.Integer_Text_IO;

package resolutions is

   PLUS_DE_UN_CHIFFRE : exception;
   CASE_NON_VIDE : exception;
   ENSEMBLE_VIDE : exception;

  -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
  -- et FAUX sinon
  -- nécessite la case c est vide
  -- lève l'exception CASE_NON_VIDE si la case n'est pas vide
    function estChiffrePlaceable(g : in Type_Grille; v : in Integer; c : in Type_Coordonnee) return Boolean;


   -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
   -- et qu'aucune autre option dans le carr� de la case c n'est vallable
   -- et FAUX sinon
   -- nécessite la case c est vide
   -- lève l'exception CASE_NON_VIDE si la case n'est pas vide
   function estChiffreValable
     (g : in Type_Grille;
      v : in Integer;
      c : in Type_Coordonnee) return Boolean;

   -- retourne l'ensemble des valeurs possibles pour la case c de la grille g
   -- necessite que la case c soit vide
   -- lève l'exception CASE_NON_VIDE si la case étudiée n'est pas vide
   function obtenirSolutionsPossibles
     (g : in Type_Grille;
      c : in Type_Coordonnee) return Type_Ensemble;

   -- retourne la valeur unique de v dans le tableau resultats
   -- nécessite qu'il n'y ait qu'un seul chiffre dans resultats
   -- lève l'exception PLUS_DE_UN_CHIFFRE s'il y a plus d'un chiffre dans resultats
   -- lève l'exception ENSEMBLE_VIDE si résultat est vide
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer;



  -- retourne les coordonnees de la premi�re case avec le moins de solution possibles d'une grille g
   function touverCaseLegere (g: in Type_Grille) return Type_Coordonnee;


   -- si la solution a ete trouve pour la grille g, alors Trouve est a VRAI et
   -- la grille est complete
   -- sinon Trouve est a FAUX et la grille n'a aucune valeur significative
   -- parcours la grille
   procedure resoudreSudoku(g: out Type_Grille; trouve :    out Boolean);

   --fonction mettant a jour le sudoku en le parcourant et placant les possibilit�
   --fonction type r�cursive.
   --condition de sortie, Aucune mise � jour de la grille.
   procedure parcourt (g: in out Type_Grille);


end resolutions;
