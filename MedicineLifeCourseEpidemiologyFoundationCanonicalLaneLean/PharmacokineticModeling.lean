import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticModelPackage where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  concentrationProfile : ℝ → ℝ
  doseResponseRelation : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  doseResponseRelationClosed : P.doseResponseRelation

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.doseResponseRelation

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact E.doseResponseRelationClosed

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse