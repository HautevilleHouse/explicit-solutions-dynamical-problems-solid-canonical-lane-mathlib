import ExplicitSolutionsDynamicalProblemsSolid.Projection

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SolidDynamicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
