import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure DiagnosticTestModel where
  sensitivity : Float
  specificity : Float
  prevalence : Float
  positivePredictiveValue : Float
  negativePredictiveValue : Float
  bayesianConsistency : Prop
  bayesianConsistencyClosed : bayesianConsistency

structure DiagnosticTestEvidence (D : DiagnosticTestModel) where
  bayesianConsistencyClosed : D.bayesianConsistency

def DiagnosticTestModelClosed (D : DiagnosticTestModel) : Prop :=
  D.bayesianConsistency

theorem diagnostic_test_model_closed_from_evidence (D : DiagnosticTestModel) (E : DiagnosticTestEvidence D) :
    DiagnosticTestModelClosed D := by
  exact E.bayesianConsistencyClosed

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse