import ExplicitSolutionsDynamicalProblemsSolid.GateLemmas

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

def ConstrainedSolidDynamicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_solid_dynamics_endgame (A : AdmissibleClass) :
    ConstrainedSolidDynamicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
