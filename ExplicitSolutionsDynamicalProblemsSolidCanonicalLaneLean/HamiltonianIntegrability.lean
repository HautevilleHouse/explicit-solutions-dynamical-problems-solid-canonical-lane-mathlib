import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure HamiltonianIntegrabilityPackage where
  phaseSpace : Type u
  symplecticForm : Type v
  hamiltonian : phaseSpace → ℝ
  integralsOfMotion : List (phaseSpace → ℝ)
  involutive : Prop
  integrable : Prop
  actionAngleVariables : Prop
  explicitSolution : Prop

structure HamiltonianIntegrabilityEvidence (H : HamiltonianIntegrabilityPackage) where
  involutiveClosed : H.involutive
  integrableClosed : H.integrable
  actionAngleVariablesClosed : H.actionAngleVariables
  explicitSolutionClosed : H.explicitSolution

def HamiltonianIntegrabilityClosed (H : HamiltonianIntegrabilityPackage) : Prop :=
  H.involutive ∧ H.integrable ∧ H.actionAngleVariables ∧ H.explicitSolution

theorem hamiltonian_integrability_closed_from_evidence (H : HamiltonianIntegrabilityPackage)
    (Ev : HamiltonianIntegrabilityEvidence H) : HamiltonianIntegrabilityClosed H := by
  exact And.intro Ev.involutiveClosed
    (And.intro Ev.integrableClosed
      (And.intro Ev.actionAngleVariablesClosed Ev.explicitSolutionClosed))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse