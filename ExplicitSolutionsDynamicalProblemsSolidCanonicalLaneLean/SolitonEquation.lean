import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.PhaseSpace

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure SolitonEquation (P : PhaseSpace) where
  nonlinearPDE : Type
  exactSolutionFamily : P.pointType → ℝ → P.pointType
  solitonExistence : Prop
  stabilityUnderPerturbation : Prop

def SolitonEquationClosed {P : PhaseSpace} (S : SolitonEquation P) : Prop :=
  S.solitonExistence ∧ S.stabilityUnderPerturbation

theorem soliton_equation_closed_from_evidence {P : PhaseSpace} (S : SolitonEquation P) (existence : S.solitonExistence) (stability : S.stabilityUnderPerturbation) : SolitonEquationClosed S := by
  exact And.intro existence stability

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
