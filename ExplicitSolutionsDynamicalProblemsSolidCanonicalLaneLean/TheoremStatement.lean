import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure ExplicitSolutionsDynamicalProblemsSolidAdmittedObject where
  space : ExplicitSolutionsDynamicalProblemsSolidSpace
  explicitSolutionKnown : Prop
  dynamicalProblemSolvable : Prop
  solidProperty : Prop
  conclusion : explicitSolutionKnown ∧ dynamicalProblemSolvable ∧ solidProperty

structure ExplicitSolutionsDynamicalProblemsSolidSpace where
  carrier : Type
  topology : TopologicalSpace carrier

def ExplicitSolutionsDynamicalProblemsSolidWitnessClosed (O : ExplicitSolutionsDynamicalProblemsSolidAdmittedObject) : Prop :=
  O.explicitSolutionKnown ∧ O.dynamicalProblemSolvable ∧ O.solidProperty

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
