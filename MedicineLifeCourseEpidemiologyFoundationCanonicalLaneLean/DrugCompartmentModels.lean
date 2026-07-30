import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  transferRates : Array (Array ℝ)
  initialConditions : Array ℝ
  compartmentEquations : Prop
  massConservation : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  compartmentEquationsClosed : C.compartmentEquations
  massConservationClosed : C.massConservation

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartmentEquations ∧ C.massConservation

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.compartmentEquationsClosed E.massConservationClosed

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse