import ExplicitSolutionsDynamicalProblemsSolid.Route

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

structure PhaseSpaceAnalyticCertificate (G : PhaseSpacePackage) where
  coordinateChartSymmetries : Prop
  compatibilityConditions : Prop
  evolutionEquations : Prop
  conservationLaws : Prop
  coordinateChartSymmetriesClosed : coordinateChartSymmetries
  compatibilityConditionsClosed : compatibilityConditions
  evolutionEquationsClosed : evolutionEquations
  conservationLawsClosed : conservationLaws
  phaseSpaceEvidence : PhaseSpaceEvidence G

def PhaseSpaceAnalyticCertificateClosed {G : PhaseSpacePackage}
    (C : PhaseSpaceAnalyticCertificate G) : Prop :=
  C.coordinateChartSymmetries ∧
  C.compatibilityConditions ∧
  C.evolutionEquations ∧
  C.conservationLaws ∧
  PhaseSpaceClosed G

theorem phase_space_analytic_certificate_closed
    {G : PhaseSpacePackage} (C : PhaseSpaceAnalyticCertificate G) :
    PhaseSpaceAnalyticCertificateClosed C := by
  exact And.intro C.coordinateChartSymmetriesClosed
    (And.intro C.compatibilityConditionsClosed
      (And.intro C.evolutionEquationsClosed
        (And.intro C.conservationLawsClosed
          (phase_space_closed_from_evidence G C.phaseSpaceEvidence))))

structure HamiltonianFlowCertificate {G : PhaseSpacePackage}
    (F : EvolutionEquationPackage G) where
  gaugeChoice : Prop
  stronglyParabolicReduction : Prop
  gaugeVectorField : Prop
  pullbackRecoversEvolution : Prop
  uniquenessCompatibility : Prop
  gaugeChoiceClosed : gaugeChoice
  stronglyParabolicReductionClosed : stronglyParabolicReduction
  gaugeVectorFieldClosed : gaugeVectorField
  pullbackRecoversEvolutionClosed : pullbackRecoversEvolution
  uniquenessCompatibilityClosed : uniquenessCompatibility
  flowEvidence : EvolutionEquationEvidence F

def HamiltonianFlowCertificateClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} (H : HamiltonianFlowCertificate F) : Prop :=
  H.gaugeChoice ∧
  H.stronglyParabolicReduction ∧
  H.gaugeVectorField ∧
  H.pullbackRecoversEvolution ∧
  H.uniquenessCompatibility ∧
  EvolutionEquationClosed F

theorem hamiltonian_flow_certificate_closed
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    (H : HamiltonianFlowCertificate F) :
    HamiltonianFlowCertificateClosed H := by
  exact And.intro H.gaugeChoiceClosed
    (And.intro H.stronglyParabolicReductionClosed
      (And.intro H.gaugeVectorFieldClosed
        (And.intro H.pullbackRecoversEvolutionClosed
          (And.intro H.uniquenessCompatibilityClosed
            (evolution_equation_closed_from_evidence F H.flowEvidence)))))

structure ShortTimeAnalyticCertificate {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} (S : ShortTimeExistencePackage F) where
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  parabolicRegularityClosed : parabolicRegularity
  localExistenceIntervalClosed : localExistenceInterval
  uniquenessOnOverlapClosed : uniquenessOnOverlap
  continuationCriterionClosed : continuationCriterion
  shortTimeEvidence : ShortTimeExistenceEvidence S

def ShortTimeAnalyticCertificateClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : Prop :=
  C.parabolicRegularity ∧
  C.localExistenceInterval ∧
  C.uniquenessOnOverlap ∧
  C.continuationCriterion ∧
  ShortTimeExistenceClosed S

theorem short_time_analytic_certificate_closed
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    {S : ShortTimeExistencePackage F} (C : ShortTimeAnalyticCertificate S) :
    ShortTimeAnalyticCertificateClosed C := by
  exact And.intro C.parabolicRegularityClosed
    (And.intro C.localExistenceIntervalClosed
      (And.intro C.uniquenessOnOverlapClosed
        (And.intro C.continuationCriterionClosed
          (short_time_existence_closed_from_evidence S C.shortTimeEvidence))))

structure LyapunovAnalyticCertificate {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    (E : LyapunovEntropyPackage S) where
  conjugateHeatEquation : Prop
  wFunctionalDefined : Prop
  muFunctionalDefined : Prop
  entropyMonotonicityFormula : Prop
  reducedVolumeMonotonicity : Prop
  conjugateHeatEquationClosed : conjugateHeatEquation
  wFunctionalDefinedClosed : wFunctionalDefined
  muFunctionalDefinedClosed : muFunctionalDefined
  entropyMonotonicityFormulaClosed : entropyMonotonicityFormula
  reducedVolumeMonotonicityClosed : reducedVolumeMonotonicity
  entropyEvidence : LyapunovEntropyEvidence E

def LyapunovAnalyticCertificateClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} (C : LyapunovAnalyticCertificate E) : Prop :=
  C.conjugateHeatEquation ∧
  C.wFunctionalDefined ∧
  C.muFunctionalDefined ∧
  C.entropyMonotonicityFormula ∧
  C.reducedVolumeMonotonicity ∧
  LyapunovEntropyClosed E

theorem lyapunov_analytic_certificate_closed
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    {S : ShortTimeExistencePackage F} {E : LyapunovEntropyPackage S}
    (C : LyapunovAnalyticCertificate E) : LyapunovAnalyticCertificateClosed C := by
  exact And.intro C.conjugateHeatEquationClosed
    (And.intro C.wFunctionalDefinedClosed
      (And.intro C.muFunctionalDefinedClosed
        (And.intro C.entropyMonotonicityFormulaClosed
          (And.intro C.reducedVolumeMonotonicityClosed
            (lyapunov_entropy_closed_from_evidence E C.entropyEvidence)))))

structure NoncollapsingAnalyticCertificate {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} (N : NoncollapsingPackage E) where
  noLocalCollapsing : Prop
  scaleInvariantVolumeLowerBound : Prop
  curvatureScaleCompatibility : Prop
  ancientSolutionCompactnessInput : Prop
  noLocalCollapsingClosed : noLocalCollapsing
  scaleInvariantVolumeLowerBoundClosed : scaleInvariantVolumeLowerBound
  curvatureScaleCompatibilityClosed : curvatureScaleCompatibility
  ancientSolutionCompactnessInputClosed : ancientSolutionCompactnessInput
  noncollapsingEvidence : NoncollapsingEvidence N

def NoncollapsingAnalyticCertificateClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : Prop :=
  C.noLocalCollapsing ∧
  C.scaleInvariantVolumeLowerBound ∧
  C.curvatureScaleCompatibility ∧
  C.ancientSolutionCompactnessInput ∧
  NoncollapsingClosed N

theorem noncollapsing_analytic_certificate_closed
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    {S : ShortTimeExistencePackage F} {E : LyapunovEntropyPackage S}
    {N : NoncollapsingPackage E} (C : NoncollapsingAnalyticCertificate N) :
    NoncollapsingAnalyticCertificateClosed C := by
  exact And.intro C.noLocalCollapsingClosed
    (And.intro C.scaleInvariantVolumeLowerBoundClosed
      (And.intro C.curvatureScaleCompatibilityClosed
        (And.intro C.ancientSolutionCompactnessInputClosed
          (noncollapsing_closed_from_evidence N C.noncollapsingEvidence))))

structure SingularityAnalyticCertificate {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    (Q : SingularityModelsPackage N) where
  blowupSequenceChosen : Prop
  pointedLimitExists : Prop
  ancientKappaSolution : Prop
  asymptoticShrinkersControlled : Prop
  blowupSequenceChosenClosed : blowupSequenceChosen
  pointedLimitExistsClosed : pointedLimitExists
  ancientKappaSolutionClosed : ancientKappaSolution
  asymptoticShrinkersControlledClosed : asymptoticShrinkersControlled
  singularityEvidence : SingularityModelsEvidence Q

def SingularityAnalyticCertificateClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) : Prop :=
  C.blowupSequenceChosen ∧
  C.pointedLimitExists ∧
  C.ancientKappaSolution ∧
  C.asymptoticShrinkersControlled ∧
  SingularityModelsClosed Q

theorem singularity_analytic_certificate_closed
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    {S : ShortTimeExistencePackage F} {E : LyapunovEntropyPackage S}
    {N : NoncollapsingPackage E} {Q : SingularityModelsPackage N}
    (C : SingularityAnalyticCertificate Q) : SingularityAnalyticCertificateClosed C := by
  exact And.intro C.blowupSequenceChosenClosed
    (And.intro C.pointedLimitExistsClosed
      (And.intro C.ancientKappaSolutionClosed
        (And.intro C.asymptoticShrinkersControlledClosed
          (singularity_models_closed_from_evidence Q C.singularityEvidence))))

structure CanonicalNeighborhoodAnalyticCertificate {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : CanonicalNeighborhoodsPackage Q) where
  highCurvaturePointClassified : Prop
  neckCapOrRoundComponent : Prop
  surgeryScaleAdmissible : Prop
  persistenceUnderFlow : Prop
  highCurvaturePointClassifiedClosed : highCurvaturePointClassified
  neckCapOrRoundComponentClosed : neckCapOrRoundComponent
  surgeryScaleAdmissibleClosed : surgeryScaleAdmissible
  persistenceUnderFlowClosed : persistenceUnderFlow
  canonicalNeighborhoodEvidence : CanonicalNeighborhoodsEvidence C

def CanonicalNeighborhoodAnalyticCertificateClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) : Prop :=
  P.highCurvaturePointClassified ∧
  P.neckCapOrRoundComponent ∧
  P.surgeryScaleAdmissible ∧
  P.persistenceUnderFlow ∧
  CanonicalNeighborhoodsClosed C

theorem canonical_neighborhood_analytic_certificate_closed
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    {S : ShortTimeExistencePackage F} {E : LyapunovEntropyPackage S}
    {N : NoncollapsingPackage E} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) :
    CanonicalNeighborhoodAnalyticCertificateClosed P := by
  exact And.intro P.highCurvaturePointClassifiedClosed
    (And.intro P.neckCapOrRoundComponentClosed
      (And.intro P.surgeryScaleAdmissibleClosed
        (And.intro P.persistenceUnderFlowClosed
          (canonical_neighborhoods_closed_from_evidence C P.canonicalNeighborhoodEvidence))))

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
