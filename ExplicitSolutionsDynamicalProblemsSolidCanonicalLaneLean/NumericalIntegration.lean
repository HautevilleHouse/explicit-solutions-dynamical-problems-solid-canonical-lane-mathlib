import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.ExplicitODESystems

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure NumericalIntegration {S : ExplicitODESystem} where
  stepSize : ℝ
  numSteps : ℕ
  initialValue : S.stateSpace
  approximateSolution : ℕ → S.stateSpace
  convergenceOrder : Prop
  stability : Prop
  convergenceOrderTerm : convergenceOrder
  stabilityTerm : stability

structure NumericalIntegrationEvidence {S : ExplicitODESystem}
    (N : NumericalIntegration S) where
  convergenceOrderClosed : N.convergenceOrder
  stabilityClosed : N.stability

def NumericalIntegrationClosed {S : ExplicitODESystem}
    (N : NumericalIntegration S) : Prop :=
  N.convergenceOrder ∧ N.stability

theorem numerical_integration_closed_from_evidence
    {S : ExplicitODESystem} (N : NumericalIntegration S)
    (E : NumericalIntegrationEvidence N) : NumericalIntegrationClosed N := by
  exact And.intro E.convergenceOrderClosed E.stabilityClosed

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse