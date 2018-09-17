import data.set.basic
open set

variables {α :Type} {β : Type}

def edges (G:set α× set β × (α→  set β)) :set α := G.1
def vertices (G:set α× set β × (α→  set β)) :set β  := G.2.1
def termini (G:set α× set β × (α→ set β)) :α →  set β := G.2.2

def connects  (G:set α× set β × (α→  set β))  (e:α) (a:β  × β ):Prop:= termini G e
={a.1,a.2}

def delete_edge (e:α) (G:set α× set β × (α→  set β)):set α× set β × (α→  set β):=
((edges G) \ {e}, vertices G, termini G )


def eulerian  :(set α× set β × (α→  set β))  → list α → β × β → Prop 
|G []         a :=  edges G = {} ∧ a.1=a.2 ∧ a.1 ∈ vertices G
|G (ee :: l)  a := ∃ (c:β), ee ∈ edges(G) ∧  connects G ee a 
                  ∧   eulerian (delete_edge ee G)   l (a.2,c)

def V:set ℕ :={1,2,3,4}

def E:set ℕ :={1,2,3,4,5,6,7}

def Ter (e:ℕ):set ℕ :=
match e with
|1     :={1,2}
|2     :={1,2}
|3     :={1,4}
|4     :={1,4}
|5     :={1,3}
|6     :={2,3}
|7     :={3,4}
|_     :={}
end

theorem konigsberg : ¬ (∃ l a b, eulerian (E,V,Ter) l (a,b)) :=
begin
end 

