import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.SolidMechanicsPDE

/-!
# Explicit Solvability Package
-/

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure ExplicitSolvabilityPackage where
  spectralDecomposition : Prop
  greensFunctionComputed : Prop
  seriesSolutionConverges : Prop
  closedFormExpression : Prop

def ExplicitSolvabilityClosed (E : ExplicitSolvabilityPackage) : Prop :=
  E.spectralDecomposition ∧ E.greensFunctionComputed ∧ E.seriesSolutionConverges ∧ E.closedFormExpression

structure ExplicitSolvabilityEvidence (E : ExplicitSolvabilityPackage) where
  spectralDecompositionClosed : E.spectralDecomposition
  greensFunctionComputedClosed : E.greensFunctionComputed
  seriesSolutionConvergesClosed : E.seriesSolutionConverges
  closedFormExpressionClosed : E.closedFormExpression

theorem explicit_solvability_closed_from_evidence
    (E : ExplicitSolvabilityPackage) (Ev : ExplicitSolvabilityEvidence E) :
    ExplicitSolvabilityClosed E := by
  exact And.intro Ev.spectralDecompositionClosed
    (And.intro Ev.greensFunctionComputedClosed
      (And.intro Ev.seriesSolutionConvergesClosed Ev.closedFormExpressionClosed))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse