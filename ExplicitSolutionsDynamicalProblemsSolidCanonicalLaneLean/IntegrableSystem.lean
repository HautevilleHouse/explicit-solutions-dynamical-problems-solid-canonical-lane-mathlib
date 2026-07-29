import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.PhaseSpace

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure IntegrableSystem (P : PhaseSpace) where
  poissonCommutingFirstIntegrals : List (P.pointType → ℝ)
  actionAngleCoordinates : Prop
  torusFoliationExists : Prop
  frequenciesNonresonant : Prop

def IntegrableSystemClosed {P : PhaseSpace} (I : IntegrableSystem P) : Prop :=
  I.actionAngleCoordinates ∧ I.torusFoliationExists ∧ I.frequenciesNonresonant

theorem integrable_system_closed_from_evidence {P : PhaseSpace} (I : IntegrableSystem P) (actionAngle : I.actionAngleCoordinates) (torus : I.torusFoliationExists) (freq : I.frequenciesNonresonant) : IntegrableSystemClosed I := by
  exact And.intro actionAngle (And.intro torus freq)

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
