
import  data.set.function
open  set

variables α β : Type
variables  A :set α 
variables  B :set β  
variable f:α → β 
variable g:β → α 
theorem Schroder_Bernstein: 
inj_on f A ∧ inj_on g B ∧ maps_to f A B ∧ maps_to g B A → ∃ h:α → β, bij_on h A B 
:=
sorry
