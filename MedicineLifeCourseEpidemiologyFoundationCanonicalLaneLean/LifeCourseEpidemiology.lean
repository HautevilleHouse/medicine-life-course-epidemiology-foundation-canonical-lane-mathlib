import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.CompartmentModel
import canonicalLaneMathlib.Pharmacokinetics
import canonicalLaneMathlib.DiagnosticInference
import canonicalLaneMathlib.SurvivalAnalysis
import canonicalLaneMathlib.EpidemiologicalTransition

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure LifeCourseEpidemiologyPackage where
  earlyLifeExposures : Prop
  childhoodFactors : Prop
  adolescenceFactors : Prop
  adultLifeFactors : Prop
  cumulativeRisk : Prop
  lifeCourseTrajectory : Prop

structure LifeCourseEpidemiologyEvidence (L : LifeCourseEpidemiologyPackage) where
  earlyLifeExposuresClosed : L.earlyLifeExposures
  childhoodFactorsClosed : L.childhoodFactors
  adolescenceFactorsClosed : L.adolescenceFactors
  adultLifeFactorsClosed : L.adultLifeFactors
  cumulativeRiskClosed : L.cumulativeRisk
  lifeCourseTrajectoryClosed : L.lifeCourseTrajectory

def LifeCourseEpidemiologyClosed (L : LifeCourseEpidemiologyPackage) : Prop :=
  L.earlyLifeExposures ∧ L.childhoodFactors ∧ L.adolescenceFactors ∧
  L.adultLifeFactors ∧ L.cumulativeRisk ∧ L.lifeCourseTrajectory

theorem life_course_epidemiology_closed_from_evidence (L : LifeCourseEpidemiologyPackage)
    (E : LifeCourseEpidemiologyEvidence L) : LifeCourseEpidemiologyClosed L := by
  exact And.intro E.earlyLifeExposuresClosed (And.intro E.childhoodFactorsClosed
    (And.intro E.adolescenceFactorsClosed (And.intro E.adultLifeFactorsClosed
      (And.intro E.cumulativeRiskClosed E.lifeCourseTrajectoryClosed))))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse