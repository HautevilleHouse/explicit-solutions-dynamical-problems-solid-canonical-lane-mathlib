import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.AdmissibleClass

/-!
# Existence and Dynamics Package
-/

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure ExistenceDynamicsPackage where
  existenceUnique : Prop
  globalWellposedness : Prop
  explicitFormulaDerived : Prop
  stabilityUnderPerturbations : Prop
  linkToAdmissibleObject : AdmissibleClass

structure ExistenceDynamicsEvidence (E : ExistenceDynamicsPackage) where
  existenceUniqueClosed : E.existenceUnique
  globalWellposednessClosed : E.globalWellposedness
  explicitFormulaDerivedClosed : E.explicitFormulaDerived
  stabilityUnderPerturbationsClosed : E.stabilityUnderPerturbations

def ExistenceDynamicsClosed (E : ExistenceDynamicsPackage) : Prop :=
  E.existenceUnique ∧ E.globalWellposedness ∧ E.explicitFormulaDerived ∧ E.stabilityUnderPerturbations

theorem existence_dynamics_closed_from_evidence
    (E : ExistenceDynamicsPackage) (Ev : ExistenceDynamicsEvidence E) :
    ExistenceDynamicsClosed E := by
  exact And.intro Ev.existenceUniqueClosed
    (And.intro Ev.globalWellposednessClosed
      (And.intro Ev.explicitFormulaDerivedClosed Ev.stabilityUnderPerturbationsClosed))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse