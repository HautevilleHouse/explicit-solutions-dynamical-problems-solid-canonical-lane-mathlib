import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.PhaseSpace

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure LaxPair (P : PhaseSpace) where
  operatorL : P.pointType → (ℕ → ℕ → ℝ)
  operatorM : P.pointType → (ℕ → ℕ → ℝ)
  commutatorEquation : Prop
  isospectralEvolution : Prop

def LaxPairClosed {P : PhaseSpace} (L : LaxPair P) : Prop :=
  L.commutatorEquation ∧ L.isospectralEvolution

theorem lax_pair_closed_from_evidence {P : PhaseSpace} (L : LaxPair P) (comm : L.commutatorEquation) (iso : L.isospectralEvolution) : LaxPairClosed L := by
  exact And.intro comm iso

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
