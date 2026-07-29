import ExplicitSolutionsDynamicalProblemsSolid.AnalyticProof

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

structure PhaseSpaceAnalyticEvidenceTerms {G : PhaseSpacePackage}
    (C : PhaseSpaceAnalyticCertificate G) where
  coordinateChartSymmetries : C.coordinateChartSymmetries
  compatibilityConditions : C.compatibilityConditions
  evolutionEquations : C.evolutionEquations
  conservationLaws : C.conservationLaws
  PhaseSpaceClosed : PhaseSpaceClosed G

def PhaseSpaceAnalyticCertificate.evidenceTerms {G : PhaseSpacePackage}
    (C : PhaseSpaceAnalyticCertificate G) : PhaseSpaceAnalyticEvidenceTerms C :=
  {
    coordinateChartSymmetries := C.coordinateChartSymmetriesClosed
    compatibilityConditions := C.compatibilityConditionsClosed
    evolutionEquations := C.evolutionEquationsClosed
    conservationLaws := C.conservationLawsClosed
    PhaseSpaceClosed := phase_space_closed_from_evidence G C.phaseSpaceEvidence
  }

structure HamiltonianFlowEvidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} (H : HamiltonianFlowCertificate F) where
  gaugeChoice : H.gaugeChoice
  stronglyParabolicReduction : H.stronglyParabolicReduction
  gaugeVectorField : H.gaugeVectorField
  pullbackRecoversEvolution : H.pullbackRecoversEvolution
  uniquenessCompatibility : H.uniquenessCompatibility
  flowClosed : EvolutionEquationClosed F

def HamiltonianFlowCertificate.evidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} (H : HamiltonianFlowCertificate F) :
    HamiltonianFlowEvidenceTerms H :=
  {
    gaugeChoice := H.gaugeChoiceClosed
    stronglyParabolicReduction := H.stronglyParabolicReductionClosed
    gaugeVectorField := H.gaugeVectorFieldClosed
    pullbackRecoversEvolution := H.pullbackRecoversEvolutionClosed
    uniquenessCompatibility := H.uniquenessCompatibilityClosed
    flowClosed := evolution_equation_closed_from_evidence F H.flowEvidence
  }

structure ShortTimeEvidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) where
  parabolicRegularity : C.parabolicRegularity
  localExistenceInterval : C.localExistenceInterval
  uniquenessOnOverlap : C.uniquenessOnOverlap
  continuationCriterion : C.continuationCriterion
  shortTimeClosed : ShortTimeExistenceClosed S

def ShortTimeAnalyticCertificate.evidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : ShortTimeEvidenceTerms C :=
  {
    parabolicRegularity := C.parabolicRegularityClosed
    localExistenceInterval := C.localExistenceIntervalClosed
    uniquenessOnOverlap := C.uniquenessOnOverlapClosed
    continuationCriterion := C.continuationCriterionClosed
    shortTimeClosed := short_time_existence_closed_from_evidence S C.shortTimeEvidence
  }

structure LyapunovEvidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} (C : LyapunovAnalyticCertificate E) where
  conjugateHeatEquation : C.conjugateHeatEquation
  wFunctionalDefined : C.wFunctionalDefined
  muFunctionalDefined : C.muFunctionalDefined
  entropyMonotonicityFormula : C.entropyMonotonicityFormula
  reducedVolumeMonotonicity : C.reducedVolumeMonotonicity
  entropyClosed : LyapunovEntropyClosed E

def LyapunovAnalyticCertificate.evidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} (C : LyapunovAnalyticCertificate E) :
    LyapunovEvidenceTerms C :=
  {
    conjugateHeatEquation := C.conjugateHeatEquationClosed
    wFunctionalDefined := C.wFunctionalDefinedClosed
    muFunctionalDefined := C.muFunctionalDefinedClosed
    entropyMonotonicityFormula := C.entropyMonotonicityFormulaClosed
    reducedVolumeMonotonicity := C.reducedVolumeMonotonicityClosed
    entropyClosed := lyapunov_entropy_closed_from_evidence E C.entropyEvidence
  }

structure NoncollapsingEvidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) where
  noLocalCollapsing : C.noLocalCollapsing
  scaleInvariantVolumeLowerBound : C.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility : C.curvatureScaleCompatibility
  ancientSolutionCompactnessInput : C.ancientSolutionCompactnessInput
  noncollapsingClosed : NoncollapsingClosed N

def NoncollapsingAnalyticCertificate.evidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : NoncollapsingEvidenceTerms C :=
  {
    noLocalCollapsing := C.noLocalCollapsingClosed
    scaleInvariantVolumeLowerBound := C.scaleInvariantVolumeLowerBoundClosed
    curvatureScaleCompatibility := C.curvatureScaleCompatibilityClosed
    ancientSolutionCompactnessInput := C.ancientSolutionCompactnessInputClosed
    noncollapsingClosed := noncollapsing_closed_from_evidence N C.noncollapsingEvidence
  }

structure SingularityEvidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) where
  blowupSequenceChosen : C.blowupSequenceChosen
  pointedLimitExists : C.pointedLimitExists
  ancientKappaSolution : C.ancientKappaSolution
  asymptoticShrinkersControlled : C.asymptoticShrinkersControlled
  singularityModelsClosed : SingularityModelsClosed Q

def SingularityAnalyticCertificate.evidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) :
    SingularityEvidenceTerms C :=
  {
    blowupSequenceChosen := C.blowupSequenceChosenClosed
    pointedLimitExists := C.pointedLimitExistsClosed
    ancientKappaSolution := C.ancientKappaSolutionClosed
    asymptoticShrinkersControlled := C.asymptoticShrinkersControlledClosed
    singularityModelsClosed := singularity_models_closed_from_evidence Q C.singularityEvidence
  }

structure CanonicalNeighborhoodEvidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) where
  highCurvaturePointClassified : P.highCurvaturePointClassified
  neckCapOrRoundComponent : P.neckCapOrRoundComponent
  surgeryScaleAdmissible : P.surgeryScaleAdmissible
  persistenceUnderFlow : P.persistenceUnderFlow
  canonicalNeighborhoodsClosed : CanonicalNeighborhoodsClosed C

def CanonicalNeighborhoodAnalyticCertificate.evidenceTerms {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {E : LyapunovEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) : CanonicalNeighborhoodEvidenceTerms P :=
  {
    highCurvaturePointClassified := P.highCurvaturePointClassifiedClosed
    neckCapOrRoundComponent := P.neckCapOrRoundComponentClosed
    surgeryScaleAdmissible := P.surgeryScaleAdmissibleClosed
    persistenceUnderFlow := P.persistenceUnderFlowClosed
    canonicalNeighborhoodsClosed := canonical_neighborhoods_closed_from_evidence C P.canonicalNeighborhoodEvidence
  }

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
