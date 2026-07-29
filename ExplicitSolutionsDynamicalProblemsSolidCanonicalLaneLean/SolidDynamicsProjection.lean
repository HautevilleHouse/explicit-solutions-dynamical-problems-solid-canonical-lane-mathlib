import ExplicitSolutionsDynamicalProblemsSolid.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

open HautevilleHouse.CanonicalLaneMathlibCore

def solidDynamicsProjection : Projection SolidDynamicsEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem solid_dynamics_projection_idempotent (x : SolidDynamicsEndgameState) :
    solidDynamicsProjection.toFun (solidDynamicsProjection.toFun x) = solidDynamicsProjection.toFun x := by
  exact solidDynamicsProjection.idempotent x

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
