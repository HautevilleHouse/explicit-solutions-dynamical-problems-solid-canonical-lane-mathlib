import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure ExplicitODESolutionPackage where
  phaseSpace : Type u
  timeDomain : Type v
  vectorField : (phaseSpace → phaseSpace) × (timeDomain → phaseSpace → phaseSpace)
  initialCondition : phaseSpace
  solution : timeDomain → phaseSpace
  existenceInterval : Prop
  uniqueness : Prop
  explicitFormula : Prop
  solutionSatisfiesODE : Prop
  initialConditionSatisfied : Prop
  maximalExtension : Prop

structure ExplicitODESolutionEvidence (E : ExplicitODESolutionPackage) where
  existenceIntervalClosed : E.existenceInterval
  uniquenessClosed : E.uniqueness
  explicitFormulaClosed : E.explicitFormula
  solutionSatisfiesODEClosed : E.solutionSatisfiesODE
  initialConditionSatisfiedClosed : E.initialConditionSatisfied
  maximalExtensionClosed : E.maximalExtension

def ExplicitODESolutionClosed (E : ExplicitODESolutionPackage) : Prop :=
  E.existenceInterval ∧ E.uniqueness ∧ E.explicitFormula ∧
  E.solutionSatisfiesODE ∧ E.initialConditionSatisfied ∧ E.maximalExtension

theorem explicit_ode_solution_closed_from_evidence (E : ExplicitODESolutionPackage)
    (Ev : ExplicitODESolutionEvidence E) : ExplicitODESolutionClosed E := by
  exact And.intro Ev.existenceIntervalClosed
    (And.intro Ev.uniquenessClosed
      (And.intro Ev.explicitFormulaClosed
        (And.intro Ev.solutionSatisfiesODEClosed
          (And.intro Ev.initialConditionSatisfiedClosed Ev.maximalExtensionClosed))))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse