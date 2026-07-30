import MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.study.exposureDefined ∧ A.study.outcomeMeasured ∧ A.study.confoundingControlled ∧ A.study.temporalOrderEstablished

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  have : AdmittedLifeCourseStudy := A.study
  exact And.intro (by exact A.study.exposureDefined)
    (And.intro (by exact A.study.outcomeMeasured)
      (And.intro (by exact A.study.confoundingControlled) (by exact A.study.temporalOrderEstablished)))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
