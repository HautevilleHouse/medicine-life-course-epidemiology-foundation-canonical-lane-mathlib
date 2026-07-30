import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticPackage where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  initialDose : ℝ
  timePoints : List ℝ

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate > 0
  distributionVolumeClosed : P.distributionVolume > 0
  eliminationRateClosed : P.eliminationRate > 0
  initialDoseClosed : P.initialDose > 0
  timePointsClosed : P.timePoints ≠ []

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate > 0 ∧ P.distributionVolume > 0 ∧ P.eliminationRate > 0 ∧ P.initialDose > 0 ∧ P.timePoints ≠ []

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed (And.intro E.distributionVolumeClosed (And.intro E.eliminationRateClosed (And.intro E.initialDoseClosed E.timePointsClosed)))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
