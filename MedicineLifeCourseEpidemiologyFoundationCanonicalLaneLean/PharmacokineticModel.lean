import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticModel where
  doseRegimen : Type u
  absorptionRate : Type v
  distributionVolume : Type w
  eliminationRate : Type x
  concentrationCurve : Type y
  linearKinetics : Prop
  linearKineticsClosed : linearKinetics

structure PharmacokineticEvidence (P : PharmacokineticModel) where
  linearKineticsClosed : P.linearKinetics

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.linearKinetics

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticEvidence P) :
    PharmacokineticModelClosed P := by
  exact E.linearKineticsClosed

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse