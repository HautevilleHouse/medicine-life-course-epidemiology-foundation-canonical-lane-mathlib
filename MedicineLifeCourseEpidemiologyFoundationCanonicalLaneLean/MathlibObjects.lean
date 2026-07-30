import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LifeCourseSpace where
  carrier : Type
  population : carrier -> Prop
  timeDomain : Set Nat

structure MedicineAdmittedObject where
  space : LifeCourseSpace
  cohortModel : Prop
  exposureOutcomeAssociation : Prop
  causalDiagram : Type
  causalConsistency : Prop
  conclusion : causalConsistency

structure MedicineEndgameState where
  object : MedicineAdmittedObject

def MedicineWitnessClosed (O : MedicineAdmittedObject) : Prop :=
  O.causalConsistency

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse