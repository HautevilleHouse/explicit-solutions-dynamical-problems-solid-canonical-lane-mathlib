import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure ExplicitODESystem where
  stateSpace : Type u
  timeDomain : Type v
  vectorField : stateSpace → timeDomain → stateSpace
  initialCondition : stateSpace
  solutionExistence : Prop
  solutionUniqueness : Prop
  solutionExistenceTerm : solutionExistence
  solutionUniquenessTerm : solutionUniqueness

structure ExplicitODESystemEvidence (S : ExplicitODESystem) where
  solutionExistenceClosed : S.solutionExistence
  solutionUniquenessClosed : S.solutionUniqueness

def ExplicitODESystemClosed (S : ExplicitODESystem) : Prop :=
  S.solutionExistence ∧ S.solutionUniqueness

theorem explicit_ode_system_closed_from_evidence (S : ExplicitODESystem)
    (E : ExplicitODESystemEvidence S) : ExplicitODESystemClosed S := by
  exact And.intro E.solutionExistenceClosed E.solutionUniquenessClosed

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse