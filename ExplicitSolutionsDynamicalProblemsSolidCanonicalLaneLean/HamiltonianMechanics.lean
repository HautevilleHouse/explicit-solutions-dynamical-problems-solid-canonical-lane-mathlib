import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.ExplicitODESystems

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure HamiltonianMechanics {S : ExplicitODESystem} where
  phaseSpace : Type u
  symplecticForm : Prop
  hamiltonianFunction : phaseSpace → ℝ
  hamiltonianEquations : Prop
  symplecticFormTerm : symplecticForm
  hamiltonianEquationsTerm : hamiltonianEquations

structure HamiltonianMechanicsEvidence {S : ExplicitODESystem}
    (H : HamiltonianMechanics S) where
  symplecticFormClosed : H.symplecticForm
  hamiltonianEquationsClosed : H.hamiltonianEquations

def HamiltonianMechanicsClosed {S : ExplicitODESystem}
    (H : HamiltonianMechanics S) : Prop :=
  H.symplecticForm ∧ H.hamiltonianEquations

theorem hamiltonian_mechanics_closed_from_evidence
    {S : ExplicitODESystem} (H : HamiltonianMechanics S)
    (E : HamiltonianMechanicsEvidence H) : HamiltonianMechanicsClosed H := by
  exact And.intro E.symplecticFormClosed E.hamiltonianEquationsClosed

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse