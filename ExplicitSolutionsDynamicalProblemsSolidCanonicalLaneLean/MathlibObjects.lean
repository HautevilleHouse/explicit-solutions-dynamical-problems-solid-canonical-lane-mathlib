import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SolidSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidAdmittedObject where
  space : SolidSpace
  closedDynamics : Prop
  explicitSolutionExists : Prop
  solutionModel : Type
  solutionTopology : TopologicalSpace solutionModel
  homeomorphicToModel : Prop
  conclusion : homeomorphicToModel

structure SolidEndgameState where
  object : SolidAdmittedObject

def SolidWitnessClosed (O : SolidAdmittedObject) : Prop :=
  O.homeomorphicToModel

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse