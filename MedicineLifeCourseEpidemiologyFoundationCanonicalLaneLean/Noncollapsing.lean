import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure NoncollapsingPackage where
  prevalenceStable : Prop
  incidenceRateBounded : Prop
  lossToFollowUpControlled : Prop

structure NoncollapsingEvidence (N : NoncollapsingPackage) where
  prevalenceStableClosed : N.prevalenceStable
  incidenceRateBoundedClosed : N.incidenceRateBounded
  lossToFollowUpControlledClosed : N.lossToFollowUpControlled

def NoncollapsingClosed (N : NoncollapsingPackage) : Prop :=
  N.prevalenceStable ∧ N.incidenceRateBounded ∧ N.lossToFollowUpControlled

theorem noncollapsing_closed_from_evidence
    (N : NoncollapsingPackage) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.prevalenceStableClosed
    (And.intro E.incidenceRateBoundedClosed E.lossToFollowUpControlledClosed)

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse