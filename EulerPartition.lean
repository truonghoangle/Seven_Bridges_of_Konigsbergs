
import   data.set.finite data.multiset
open  set  finset 

variable α : Type

def square (n:ℕ ):multiset ℕ :=multiset.join(multiset.repeat (multiset.range (n+1)) (n+1))

theorem Euler_Partition (n :ℕ): (multiset.filter (λ s:multiset ℕ , multiset.sum (s.map (λ i,i)) =n ∧ (∀ i, i∈ s→ i % 2=1)) (multiset.powerset (square n))).card
= (filter (λ s:finset ℕ, s.sum (λ i,i)=n) (powerset(range (n+1)))).card:=
sorry
