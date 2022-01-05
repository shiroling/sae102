pragma Ada_2012;
package body TAD_ensemble is

    ------------------------
    -- construireEnsemble --
    ------------------------

    function construireEnsemble return Type_Ensemble is
        e: Type_Ensemble;
        begin
            for i in 1 .. 9 loop
                e(i) := 0;
            end loop; 
            return e;
        end construireEnsemble;

    ------------------
    -- ensembleVide --
    ------------------

    function ensembleVide (e : in Type_Ensemble) return Boolean is
        estPlein : Boolean := True;
        i: Integer; 
        
        begin
            i:= 1;
            while i < 10 AND estPlein loop
                if e(1) = 1 then
                    estPlein := False;
                end if;
            end loop;
            return estPlein;
        end ensembleVide;

    -----------------------
    -- appartientChiffre --
    -----------------------

    function appartientChiffre
    (e : in Type_Ensemble; v : Integer) return Boolean is
        begin
            return e(v);
        end appartientChiffre;

    --------------------
    -- nombreChiffres --
    --------------------

    function nombreChiffres (e : in Type_Ensemble) return Integer is
        nbElement: Integer:= 0; 
        begin
            for i in 1 .. 9 loop
                if e(i) = 1 then
                    nbElement := nbElement + 1;
                end if;
            end loop;
            return nbElement;
        end nombreChiffres;

    --------------------
    -- ajouterChiffre --
    --------------------

    procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
        begin
            e(v) := 1;
        end ajouterChiffre;

    --------------------
    -- retirerChiffre --
    --------------------

    procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
        begin
            e(v) := 0;
        end retirerChiffre;

end TAD_ensemble;
