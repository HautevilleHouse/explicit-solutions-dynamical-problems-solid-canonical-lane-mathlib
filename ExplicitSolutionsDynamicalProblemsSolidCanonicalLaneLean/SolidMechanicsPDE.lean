import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.ExistenceDynamics

/-!
# Solid Mechanics PDE Package
-/

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure SolidMechanicsPDEPackage where
  strainTensor : Type u
  stressTensor : Type v
  equilibriumEquation : Prop
  constitutiveLaw : Prop
  boundaryConditions : Prop

def SolidMechanicsPDEClosed (S : SolidMechanicsPDEPackage) : Prop :=
  S.equilibriumEquation ∧ S.constitutiveLaw ∧ S.boundaryConditions

structure SolidMechanicsPDEEvidence (S : SolidMechanicsPDEPackage) where
  equilibriumEquationClosed : S.equilibriumEquation
  constitutiveLawClosed : S.constitutiveLaw
  boundaryConditionsClosed : S.boundaryConditions

theorem solid_mechanics_pde_closed_from_evidence
    (S : SolidMechanicsPDEPackage) (Ev : SolidMechanicsPDEEvidence S) :
    SolidMechanicsPDEClosed S := by
  exact And.intro Ev.equilibriumEquationClosed
    (And.intro Ev.constitutiveLawClosed Ev.boundaryConditionsClosed)

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse