
import   data.set.finite
open  set

variables α  : Type
variable [decidable_eq α]


 theorem infinite_ramsey (s  :set α) (C:finset α → ℕ  ) (m n:ℕ):
 infinite s ∧
 (∀ t:finset α,   t.to_set ⊆ s ∧ t.card  = n  → C t≤ m) 
→  ∃ t c, infinite t ∧ t ⊆ s ∧ 
        (∀ u:finset α,    u.to_set ⊆ t ∧ u.card =n  → C u = c)
:=
begin
end


def complete_graph (s:finset(finset α )):Prop:= 
(∀ t:finset α, t∈ s → t.card =2) ∧ 
(∀ t:finset α, t ∈ finset.powerset( s.bind (λ t,t)) ∧ t.card=2 →  t ∈ s )



def complete_k_graph (s:finset(finset α )) (k:ℕ):Prop:= 
(∀ t:finset α, t∈ s → t.card =k) ∧ 
(∀ t:finset α, t ∈ finset.powerset( s.bind (λ t,t)) ∧ t.card=k →  t ∈ s )





theorem ramsey2 (M N:ℕ ):
∃ (n : ℕ) (s:finset(finset α )),
  complete_graph _ s ∧
     ( s.bind (λ t,t)).card =n ∧
      ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ s → c t ≤ 1) →
        (∃ r t : finset(finset α ),
           r ⊆ s ∧ complete_graph _ r ∧ 
             t ⊆ s ∧ complete_graph _ t ∧ 
               (∀ (e : finset α), e ∈ t → c e = 0) ∧
                 (∀ (e : finset α), e ∈ r → c e = 1) ∧  ( t.bind (λ t,t)).card =M ∧ 
                  ( r.bind (λ t,t)).card =N)
:=
begin
end

theorem colours_ramsey (S:finset ℕ ):  
∃ (n : ℕ) (s : finset(finset α)),
  complete_graph _ s ∧
     ( s.bind (λ t,t)).card =n ∧
       ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ s → c t ≤ S.card ) →
              ∀ (ci : ℕ),ci ∈ S →
               (∃ (ri : finset(finset α )) (cc:ℕ ), 
                ri ⊆ s ∧ complete_graph _ ri ∧ 
                ( ri.bind (λ t,t)).card = ci ∧ 
                 ∀ (x : finset α), x ∈ ri → c x = cc )
:=
begin
end


theorem ramsey2_hypergraph (M N k:ℕ ):
∃ (n : ℕ) (s:finset(finset α )),
  complete_k_graph _ s k ∧
     ( s.bind (λ t,t)).card =n ∧
      ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ s → c t ≤ 1) →
        (∃ r t : finset(finset α ),
           r ⊆ s ∧ complete_k_graph _ r k ∧ 
             t ⊆ s ∧ complete_k_graph _ t k ∧ 
               (∀ (e : finset α), e ∈ t → c e = 0) ∧
                 (∀ (e : finset α), e ∈ r → c e = 1) ∧  ( t.bind (λ t,t)).card =M ∧ 
                  ( r.bind (λ t,t)).card =N)
:=
begin
end



theorem colours_ramsey_hypergraph (S:finset ℕ) (k:ℕ):  
∃ (n : ℕ) (s : finset(finset α)),
  complete_k_graph _ s k ∧
     ( s.bind (λ t,t)).card =n ∧
       ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ s → c t ≤ S.card ) →
              ∀ (ci : ℕ), ci ∈ S →
               (∃ (ri : finset(finset α )) (cc:ℕ ), 
               ri ⊆ s ∧ complete_k_graph _ ri k ∧ 
               ( ri.bind (λ t,t)).card = ci ∧ 
                 ∀ (x : finset α), x ∈ ri → c x = cc ) 
:=
begin
end



def complete_graph_v1 (s:finset α ):finset(finset α):= 
(finset.powerset s).filter (λ t:finset α, t.card =2)


def complete_k_graph_v1 (s:(finset α )) (k:ℕ):finset(finset α) := 
(finset.powerset s).filter (λ t:finset α, t.card =k)


theorem ramsey2_v1 (M N:ℕ ):
∃ (n : ℕ) (s:finset α ),
      s.card =n ∧
      ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ (complete_graph_v1 α s) → c t ≤ 1) →
        (∃ r t : finset α,
           r ⊆ s ∧  t ⊆ s ∧  
               (∀ (e : finset α), e ∈ (complete_graph_v1 _ r) → c e = 0) ∧
                 (∀ (e : finset α), e ∈ complete_graph_v1 _ t → c e = 1) ∧  
                  t.card =M ∧ r.card =N)
:=
begin
end


theorem colours_ramsey_v1 (S:finset ℕ ):  
∃ (n : ℕ) (s :(finset α)),
      s.card =n ∧
       ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ complete_graph_v1 _ s → c t ≤ S.card ) →
              ∀ (ci : ℕ), ci ∈ S →
               (∃ (ri : finset α ) (cc:ℕ ), 
                 ri ⊆ s ∧     ri.card = ci ∧ 
                 ∀ (x : finset α), x ∈ complete_graph_v1 _ ri → c x = cc ) 
:=
begin

end


theorem ramsey2_hypergraph_v1 (M N k:ℕ ):
∃ (n : ℕ) (s:(finset α )),
      s.card =n ∧
      ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ (complete_k_graph_v1 _ s k) → c t ≤ 1) →
        (∃ r t : finset α ,
           r ∈  (complete_k_graph_v1 _ s M) ∧ 
           t ∈  (complete_k_graph_v1 _ s N) ∧ 
               (∀ (e : finset α), e ∈ (complete_k_graph_v1 _ r k) → c e = 0) ∧
                 (∀ (e : finset α), e ∈ (complete_k_graph_v1 _ t k) → c e = 1))                 
:=
begin
end




theorem colours_ramsey_hypergraph_v1 (S:finset ℕ) (k:ℕ):  
∃ (n : ℕ) (s :finset α),
     ( s.card =n ∧
       ∀ (c : finset α → ℕ),
        (∀ (t : finset α), t ∈ (complete_k_graph_v1 _ s k) → c t ≤ S.card ) →
              ∀ (ci : ℕ),  ci ∈ S →
               (∃ (ri : finset α ) (cc:ℕ ), 
                ri ∈ (complete_k_graph_v1 _ s ci)∧  
                 ∀ (x : finset α), x ∈ (complete_k_graph_v1 _ ri k) → c x = cc ))
:=
begin
end

