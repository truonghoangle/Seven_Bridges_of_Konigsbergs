import  data.real.basic data.finset  data.set.lattice data.nat.choose analysis.measure_theory.measurable_space analysis.measure_theory.measure_space

open  real  



namespace inclusion_exclusion_finset 
variables α β  : Type

instance :lattice.semilattice_inf_top (finset β)
:=
begin
end

theorem inclusion_exclusion_usual [decidable_eq β] {s : finset α} {t : α → finset β}: 
  (((s.bind t).card):ℝ) =
  ((finset.range (s.card + 1)).filter (λ k, k>0)).sum 
  (λ k, (-1:ℝ)^( k+1) * ((finset.powerset s).filter (λ s₁:finset α, s₁.card=k)).sum 
   (λ s₁:finset α, (s₁.inf t).card))  
:=
begin

end

instance  :decidable_pred (λ (s₁ : finset α), ¬s₁ = ∅):= 
begin

end

theorem inclusion_exclusion [decidable_eq β] {s : finset α} {t : α → finset β}: 
  (((s.bind t).card):ℝ) =
  ((finset.powerset s).filter (λ s₁, (s₁ ≠  ∅))).sum 
     (λ s₁:finset α, (-1:ℝ)^(s₁.card+1) * (s₁.inf t).card) 
:=
begin
end


theorem special_inclusion_exclusion [decidable_eq β] {s : finset α} {t : α → finset β}
(f:ℕ → ℕ) (h:∀ k A, A∈ (finset.powerset s).filter (λ s₁:finset α, s₁.card =k) → (A.inf t).card=f k):
(((s.bind t).card):ℝ) = 
((finset.range (s.card + 1)).filter (λ k, k>0)).sum 
(λ k, (-1:ℝ)^( k+1) * (choose (s.card) k) * (f k)) 
:=
begin
end




theorem Mobius_inclusion_exclusion {g f:finset α → ℝ} 
(h: ∀ A, g A= (finset.powerset A).sum (λ s, f s)):
∀ A, f A= (finset.powerset A).sum (λ s, (-1:ℝ)^(A.card -s.card) * g s)
:=
begin
end


theorem inclusion_exclusion_sysmetric {g f:finset α → ℝ} 
(h: ∀ A, g A= (finset.powerset A).sum (λ s, (-1)^(s.card)* f s)):
∀ A, f A= (finset.powerset A).sum (λ s, (-1:ℝ)^(s.card) * g s)
:=
begin
end



end inclusion_exclusion_finset


namespace measure_inclusion_exclusion 
variables α β  : Type
variables [measurable_space β ] {μ: measure_theory.measure β } 
variables{s : finset α} {t : α → set β}
variables (h: ∀ i, i∈ s→ is_measurable (t i))
variables (hfin: ∀ i, i∈ s→  μ (t i)< ⊤)


theorem measure_inclusion_exclusion: 
μ (⋃b∈s, t b)+ 
 ((finset.range (s.card + 1)).filter (λ n, n>0 ∧ n % 2=0)).sum 
   (λ k, ((finset.powerset s).filter (λ s₁:finset α, s₁.card=k)).sum  
       (λ s₁:finset α,μ (⋂b∈s₁, t b))) 
=((finset.range (s.card + 1)).filter (λ n, n>0 ∧ n % 2=1)).sum 
   (λ k, ((finset.powerset s).filter (λ s₁:finset α, s₁.card=k)).sum  
       (λ s₁:finset α,μ (⋂b∈s₁, t b)))
:=
begin
end

end measure_inclusion_exclusion
