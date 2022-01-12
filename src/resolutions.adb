pragma Ada_2012;
package body resolutions is

    -----------------------
    --estChiffrePlaceable--
    -----------------------
    function estChiffrePlaceable(g : in Type_Grille; v : in Integer; c : in Type_Coordonnee) return Boolean is
    ens: Type_Ensemble;
    begin
    if not caseVide(g, c) then
        raise CASE_NON_VIDE;
    end if;
    ens:= construireEnsemble;
    
    ens:= obtenirChiffresDUneColonne(g, obtenirColonne(c));
    if appartientChiffre(ens, v) then
        return FALSE;
    end if;

    ens:= obtenirChiffresDUneLigne(g, obtenirLigne(c));
    if appartientChiffre(ens, v) then
        return FALSE;
    end if;

    ens:= obtenirChiffresDUnCarre (g, obtenirCarre(c));
        if appartientChiffre(ens, v) then
    return FALSE;
    end if;

    return TRUE;
    end estChiffrePlaceable;
    -----------------------
    -- estChiffreValable --
    -----------------------
    function estChiffreValable(g : in Type_Grille; v : in Integer; c : in Type_Coordonnee) return Boolean is
    cosCarre, cosRecherche: Type_Coordonnee;
    begin
    if not estChiffrePlaceable(g, v, c) then
        return FALSE;
    end if;
    cosCarre:= obtenirCoordonneeCarre(obtenirCarre(c));
    for i in 0..2 loop
        for j in 0..2 loop
            cosRecherche:= construireCoordonnees(obtenirLigne(cosCarre)+i,
                                                 obtenirColonne(cosCarre)+j);
            if caseVide(g, cosRecherche) then
                if estChiffrePlaceable(g, v, cosRecherche) AND cosRecherche /= c then
                   return FALSE; 
                end if;
             end if; 
        end loop;
    end loop;

    return TRUE;
    end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

    function obtenirSolutionsPossibles(g : in Type_Grille; c : in Type_Coordonnee)
                                       return Type_Ensemble is
    ens: Type_Ensemble:= construireEnsemble;
    begin
        if caseVide(g, c) then
            raise CASE_NON_VIDE;
        end if;
        
        for i in 1 .. 9 loop
            if estChiffreValable(g, i, c) then
                ajouterChiffre(ens, i);
            end if;
        end loop;
        
        return ens;
    end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

    function rechercherSolutionUniqueDansEnsemble(resultats : in Type_Ensemble) return Integer is
    begin
        if ensembleVide(resultats) then
            raise ENSEMBLE_VIDE;
        end if;
        if nombreChiffres(resultats) /= 1 then
            raise PLUS_DE_UN_CHIFFRE;
        end if;

        for i in 1..9 loop
            if appartientChiffre(resultats, i) then
                return i;
            end if;
        end loop;
        return 0;
    end rechercherSolutionUniqueDansEnsemble;

    function touverCaseLegere (g: in Type_Grille) return Type_Coordonnee is 
    c: Type_Coordonnee;
    coRecherche: Type_Coordonnee;
    poid: Integer := 10;
    temp: Integer;
    begin
    for i in 1..9 loop
        for j in 1..9 loop
            coRecherche:=construireCoordonnees(i, j);
            temp:= nombreChiffres( obtenirSolutionsPossibles(g, coRecherche));
            if temp < poid then
                c:= coRecherche;
                poid:= temp;
            end if;
        end loop;
    end loop;


    put("trouvé case plus légére de masse: "); put(poid);
    return c;
    end touverCaseLegere;
   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------
    procedure parcourt (g: in out Type_Grille) is
    reroll: Boolean:= FALSE;
    begin

        for v in 1..9 loop
            for i in 1..9 loop
                for j in 1..9 loop
                    if caseVide(g, construireCoordonnees(i, j)) then
                        if estChiffreValable(g, v, construireCoordonnees(i, j)) then
                            fixerChiffre(g, construireCoordonnees(i, j), v);
                            reroll:= TRUE;
                        end if;
                    end if;
                end loop;
            end loop;
        end loop;


        if reroll then
            parcourt(g);
        end if;
    end parcourt;
   --------------------
   -- resoudreSudoku --
   --------------------
    procedure resoudreSudoku (g : out Type_Grille; trouve : out Boolean) is
    co: Type_Coordonnee;
    begin
        parcourt(g);
        trouve:= estRemplie(g);
        if not trouve then
            afficherGrille(g);
            co:= touverCaseLegere(g);
        end if;
    end resoudreSudoku;

end resolutions;
