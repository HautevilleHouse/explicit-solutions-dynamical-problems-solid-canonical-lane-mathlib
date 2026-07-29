import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure FrobeniusIntegrabilityPackage where
  manifold : Type u
  distribution : Type v
  involutive : Prop
  integralSubmanifold : Type w
  foliation : Prop
  localCoordinates : Prop
  explicitChart : Prop

structure FrobeniusIntegrabilityEvidence (F : FrobeniusIntegrabilityPackage) where
  involutiveClosed : F.involutive
  foliationClosed : F.foliation
  localCoordinatesClosed : F.localCoordinates
  explicitChartClosed : F.explicitChart

def FrobeniusIntegrabilityClosed (F : FrobeniusIntegrabilityPackage) : Prop :=
  F.involutive ∧ F.foliation ∧ F.localCoordinates ∧ F.explicitChart

theorem frobenius_integrability_closed_from_evidence (F : FrobeniusIntegrabilityPackage)
    (Ev : FrobeniusIntegrabilityEvidence F) : FrobeniusIntegrabilityClosed F := by
  exact And.intro Ev.involutiveClosed
    (And.intro Ev.foliationClosed
      (And.intro Ev.localCoordinatesClosed Ev.explicitChartClosed))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse