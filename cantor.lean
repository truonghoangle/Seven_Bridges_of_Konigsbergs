
import   data.set.function  set_theory.cardinal
open  set  function 

universes u
variable α : Type u


theorem Cantor0 (s :set α): ¬ (∃ f, maps_to f s (powerset s) ∧ surj_on f s (powerset s) ) ∧ 
   (∃ f:α → set α, inj_on f s)
   := sorry

theorem Cantor: ¬ (∃ f:α → set α, surjective f ) ∧ (∃ f:α → set α, injective f)
:=
sorry

theorem Cantor_cardinal: cardinal.mk(α) < cardinal.mk(set(α )):=
sorry

