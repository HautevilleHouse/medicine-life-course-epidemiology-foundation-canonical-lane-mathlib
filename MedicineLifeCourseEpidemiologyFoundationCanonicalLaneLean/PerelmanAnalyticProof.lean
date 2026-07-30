import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelCertificate where
  absorptionValid : Prop
  eliminationValid : Prop
  volumeOfDistributionValid : Prop
  absorptionValidClosed : absorptionValid
  eliminationValidClosed : eliminationValid
  volumeOfDistributionValidClosed : volumeOfDistributionValid
  compartmentEvidence : NoncollapsingEvidence defaultNoncollapsingPackage

def CompartmentModelCertificateClosed (C : CompartmentModelCertificate) : Prop :=
  C.absorptionValid ∧ C.eliminationValid ∧ C.volumeOfDistributionValid ∧ NoncollapsingClosed defaultNoncollapsingPackage

theorem compartment_model_certificate_closed (C : CompartmentModelCertificate) :
    CompartmentModelCertificateClosed C := by
  exact And.intro C.absorptionValidClosed (And.intro C.eliminationValidClosed (And.intro C.volumeOfDistributionValidClosed (noncollapsing_closed_from_evidence defaultNoncollapsingPackage C.compartmentEvidence)))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse