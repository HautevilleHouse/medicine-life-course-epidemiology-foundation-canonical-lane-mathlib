import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean.CompartmentModel
import HautevilleHouse.MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean.PharmacokineticModel
import HautevilleHouse.MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean.DiagnosticInference
import HautevilleHouse.MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean.SurvivalAnalysis
import HautevilleHouse.MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean.CausalInference

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure LifeCourseEpidemiologyFoundation where
  compartmentModel : CompartmentModelPackage
  pharmacokinetic : PharmacokineticModelPackage compartmentModel
  diagnostic : DiagnosticTestPackage
  survival : SurvivalModelPackage
  causal : CausalModelPackage

structure LifeCourseEpidemiologyEvidence (F : LifeCourseEpidemiologyFoundation) where
  compartmentClosed : CompartmentModelClosed F.compartmentModel
  pharmacokineticClosed : PharmacokineticModelClosed F.pharmacokinetic
  diagnosticClosed : DiagnosticInferenceClosed F.diagnostic
  survivalClosed : SurvivalAnalysisClosed F.survival
  causalClosed : CausalInferenceClosed F.causal

def LifeCourseEpidemiologyFoundationClosed (F : LifeCourseEpidemiologyFoundation) : Prop :=
  CompartmentModelClosed F.compartmentModel ∧
  PharmacokineticModelClosed F.pharmacokinetic ∧
  DiagnosticInferenceClosed F.diagnostic ∧
  SurvivalAnalysisClosed F.survival ∧
  CausalInferenceClosed F.causal

theorem life_course_epidemiology_foundation_closed (F : LifeCourseEpidemiologyFoundation)
    (E : LifeCourseEpidemiologyEvidence F) : LifeCourseEpidemiologyFoundationClosed F := by
  exact And.intro E.compartmentClosed
    (And.intro E.pharmacokineticClosed
      (And.intro E.diagnosticClosed
        (And.intro E.survivalClosed E.causalClosed)))

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse