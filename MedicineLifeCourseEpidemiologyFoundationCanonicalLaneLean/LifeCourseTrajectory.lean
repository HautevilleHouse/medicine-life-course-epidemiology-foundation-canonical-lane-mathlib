import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure LifeCourseTrajectoryPackage where
  earlyLifeExposure : ℝ
  cumulativeRisk : ℝ
  criticalPeriod : Prop
  accumulationModel : Prop
  trajectoryContinuity : Prop

structure LifeCourseTrajectoryEvidence (L : LifeCourseTrajectoryPackage) where
  criticalPeriodClosed : L.criticalPeriod
  accumulationModelClosed : L.accumulationModel
  trajectoryContinuityClosed : L.trajectoryContinuity

def LifeCourseTrajectoryClosed (L : LifeCourseTrajectoryPackage) : Prop :=
  L.criticalPeriod ∧ L.accumulationModel ∧ L.trajectoryContinuity

theorem life_course_trajectory_closed_from_evidence (L : LifeCourseTrajectoryPackage)
    (E : LifeCourseTrajectoryEvidence L) : LifeCourseTrajectoryClosed L := by
  exact And.intro E.criticalPeriodClosed
    (And.intro E.accumulationModelClosed E.trajectoryContinuityClosed)

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse