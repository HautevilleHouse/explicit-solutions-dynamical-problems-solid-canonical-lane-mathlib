import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.HamiltonianMechanics

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure IntegrableSystem {S : ExplicitODESystem} {H : HamiltonianMechanics S} where
  commutingFirstIntegrals : Prop
  actionAngleVariables : Prop
  completeIntegrability : Prop
  commutingFirstIntegralsTerm : commutingFirstIntegrals
  actionAngleVariablesTerm : actionAngleVariables
  completeIntegrabilityTerm : completeIntegrability

structure IntegrableSystemEvidence {S : ExplicitODESystem}
    {H : HamiltonianMechanics S} (I : IntegrableSystem H) where
  commutingFirstIntegralsClosed : I.commutingFirstIntegrals
  actionAngleVariablesClosed : I.actionAngleVariables
  completeIntegrabilityClosed : I.completeIntegrability

def IntegrableSystemClosed {S : ExplicitODESystem}
    {H : HamiltonianMechanics S} (I : IntegrableSystem H) : Prop :=
  I.commutingFirstIntegrals ∧ I.actionAngleVariables ∧ I.completeIntegrability

theorem integrable_system_closed_from_evidence
    {S : ExplicitODESystem} {H : HamiltonianMechanics S}
    (I : IntegrableSystem H) (E : IntegrableSystemEvidence I) :
    IntegrableSystemClosed I := by
  exact And.intro E.commutingFirstIntegralsClosed
    (And.intro E.actionAngleVariablesClosed E.completeIntegrabilityClosed)

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse