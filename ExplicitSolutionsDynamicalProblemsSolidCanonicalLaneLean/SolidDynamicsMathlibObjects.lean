import ExplicitSolutionsDynamicalProblemsSolid.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

open HautevilleHouse.CanonicalLaneMathlibCore

structure SolidDynamicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidDynamicsAdmittedObject where
  space : SolidDynamicsSpace
  closedSolidDynamicalSystem : Prop
  explicitSolutionExists : Prop
  solidModel : Type
  solidTopology : TopologicalSpace solidModel
  diffeomorphicToSolid : Prop
  conclusion : diffeomorphicToSolid

structure SolidDynamicsEndgameState where
  object : SolidDynamicsAdmittedObject

def SolidDynamicsWitnessClosed (O : SolidDynamicsAdmittedObject) : Prop :=
  O.diffeomorphicToSolid

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
