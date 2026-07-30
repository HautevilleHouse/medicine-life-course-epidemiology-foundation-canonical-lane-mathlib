import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure EpidemiologicalTransitionPackage where
  populationHealth : Type u
  communicableDiseasePattern : Prop
  nonCommunicableDiseasePattern : Prop
  lifeExpectancyTrend : Prop
  healthTransitionModel : Prop
  policyIntervention : Prop

structure EpidemiologicalTransitionEvidence (E : EpidemiologicalTransitionPackage) where
  communicableDiseasePatternClosed : E.communicableDiseasePattern
  nonCommunicableDiseasePatternClosed : E.nonCommunicableDiseasePattern
  lifeExpectancyTrendClosed : E.lifeExpectancyTrend
  healthTransitionModelClosed : E.healthTransitionModel
  policyInterventionClosed : E.policyIntervention

def EpidemiologicalTransitionClosed (E : EpidemiologicalTransitionPackage) : Prop :=
  E.communicableDiseasePattern ∧ E.nonCommunicableDiseasePattern ∧
  E.lifeExpectancyTrend ∧ E.healthTransitionModel ∧ E.policyIntervention

theorem epidemiological_transition_closed_from_evidence (E : EpidemiologicalTransitionPackage)
    (Ev : EpidemiologicalTransitionEvidence E) : EpidemiologicalTransitionClosed E := by
  exact And.intro Ev.communicableDiseasePatternClosed (And.intro Ev.nonCommunicableDiseasePatternClosed
    (And.intro Ev.lifeExpectancyTrendClosed (And.intro Ev.healthTransitionModelClosed
      Ev.policyInterventionClosed)))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse