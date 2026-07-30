import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure AdmittedLifeCourseStudy where
  cohort : Type u
  exposureModel : Type v
  outcomeType : Type w
  timeScale : Type t
  confounderSet : Type c
  exposureDefined : Prop
  outcomeMeasured : Prop
  confoundingControlled : Prop
  temporalOrderEstablished : Prop

structure AdmissibleClass where
  study : AdmittedLifeCourseStudy
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.study.exposureDefined ∧ A.study.outcomeMeasured ∧ A.study.confoundingControlled ∧ A.study.temporalOrderEstablished) ∧
  (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
