import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity > 0 ∧ D.sensitivity ≤ 1
  specificityClosed : D.specificity > 0 ∧ D.specificity ≤ 1
  prevalenceClosed : D.prevalence > 0 ∧ D.prevalence ≤ 1
  ppvClosed : D.positivePredictiveValue > 0 ∧ D.positivePredictiveValue ≤ 1
  npvClosed : D.negativePredictiveValue > 0 ∧ D.negativePredictiveValue ≤ 1

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  (D.sensitivity > 0 ∧ D.sensitivity ≤ 1) ∧ (D.specificity > 0 ∧ D.specificity ≤ 1) ∧ (D.prevalence > 0 ∧ D.prevalence ≤ 1) ∧ (D.positivePredictiveValue > 0 ∧ D.positivePredictiveValue ≤ 1) ∧ (D.negativePredictiveValue > 0 ∧ D.negativePredictiveValue ≤ 1)

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed (And.intro E.specificityClosed (And.intro E.prevalenceClosed (And.intro E.ppvClosed E.npvClosed)))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
