import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure DoseResponseModel where
  doseLevels : List Float
  responseFunction : Type u
  efficacyEndpoint : Type v
  monotonicResponse : Prop
  monotonicResponseClosed : monotonicResponse

structure DoseResponseEvidence (D : DoseResponseModel) where
  monotonicResponseClosed : D.monotonicResponse

def DoseResponseModelClosed (D : DoseResponseModel) : Prop :=
  D.monotonicResponse

theorem dose_response_model_closed_from_evidence (D : DoseResponseModel) (E : DoseResponseEvidence D) :
    DoseResponseModelClosed D := by
  exact E.monotonicResponseClosed

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse