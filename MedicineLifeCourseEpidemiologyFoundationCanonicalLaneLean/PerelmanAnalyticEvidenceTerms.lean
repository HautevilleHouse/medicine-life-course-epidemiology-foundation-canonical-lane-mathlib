import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure ExposureModelAnalyticCertificate where
  exposureDefinitionValid : Prop
  measurementErrorControlled : Prop
  exposureDefinitionValidClosed : exposureDefinitionValid
  measurementErrorControlledClosed : measurementErrorControlled
  exposureEvidence : NoncollapsingEvidence defaultNoncollapsingPackage

defaultNoncollapsingPackage : NoncollapsingPackage := {
  prevalenceStable := True
  incidenceRateBounded := True
  lossToFollowUpControlled := True
}

structure ExposureModelAnalyticCertificateClosed (C : ExposureModelAnalyticCertificate) : Prop :=
  C.exposureDefinitionValid ∧ C.measurementErrorControlled ∧ NoncollapsingClosed defaultNoncollapsingPackage

theorem exposure_model_analytic_certificate_closed (C : ExposureModelAnalyticCertificate) :
    ExposureModelAnalyticCertificateClosed C := by
  exact And.intro C.exposureDefinitionValidClosed (And.intro C.measurementErrorControlledClosed (noncollapsing_closed_from_evidence defaultNoncollapsingPackage C.exposureEvidence))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse