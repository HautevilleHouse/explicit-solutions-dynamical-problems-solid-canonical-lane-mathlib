import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure AdmissibleClass where
  object : SolidAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SolidWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse