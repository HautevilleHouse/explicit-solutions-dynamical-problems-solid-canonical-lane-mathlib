import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.ExplicitODESystems

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure LieGroupIntegration {S : ExplicitODESystem} where
  groupManifold : Type u
  lieAlgebra : Type v
  exponentialMap : lieAlgebra → groupManifold
  flowPreservesStructure : Prop
  numericalScheme : Prop
  flowPreservesStructureTerm : flowPreservesStructure
  numericalSchemeTerm : numericalScheme

structure LieGroupIntegrationEvidence {S : ExplicitODESystem}
    (L : LieGroupIntegration S) where
  flowPreservesStructureClosed : L.flowPreservesStructure
  numericalSchemeClosed : L.numericalScheme

def LieGroupIntegrationClosed {S : ExplicitODESystem}
    (L : LieGroupIntegration S) : Prop :=
  L.flowPreservesStructure ∧ L.numericalScheme

theorem lie_group_integration_closed_from_evidence
    {S : ExplicitODESystem} (L : LieGroupIntegration S)
    (E : LieGroupIntegrationEvidence L) : LieGroupIntegrationClosed L := by
  exact And.intro E.flowPreservesStructureClosed E.numericalSchemeClosed

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse