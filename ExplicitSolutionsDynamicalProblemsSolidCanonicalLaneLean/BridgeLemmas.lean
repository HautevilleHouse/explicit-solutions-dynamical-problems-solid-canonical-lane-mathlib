import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SolidWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse