import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  healthy : Prop
  diseased : Prop
  transitionRate : Prop
  recoveryRate : Prop
  initialPopulation : Nat
  timeHorizon : Nat

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  healthyClosed : C.healthy
  diseasedClosed : C.diseased
  transitionRateClosed : C.transitionRate
  recoveryRateClosed : C.recoveryRate
  initialPopulationClosed : C.initialPopulation > 0
  timeHorizonClosed : C.timeHorizon > 0

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.healthy ∧ C.diseased ∧ C.transitionRate ∧ C.recoveryRate ∧ C.initialPopulation > 0 ∧ C.timeHorizon > 0

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.healthyClosed (And.intro E.diseasedClosed (And.intro E.transitionRateClosed (And.intro E.recoveryRateClosed (And.intro E.initialPopulationClosed E.timeHorizonClosed))))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
