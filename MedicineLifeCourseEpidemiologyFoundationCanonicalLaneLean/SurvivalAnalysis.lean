import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  censoringIndicator : Prop
  eventTime : ℝ
  covariate : Type

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : ∀ t, S.hazardFunction t > 0
  survivalFunctionClosed : ∀ t, S.survivalFunction t ≤ 1
  censoringIndicatorClosed : S.censoringIndicator
  eventTimeClosed : S.eventTime > 0

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  (∀ t, S.hazardFunction t > 0) ∧ (∀ t, S.survivalFunction t ≤ 1) ∧ S.censoringIndicator ∧ S.eventTime > 0

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed (And.intro E.survivalFunctionClosed (And.intro E.censoringIndicatorClosed E.eventTimeClosed))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
