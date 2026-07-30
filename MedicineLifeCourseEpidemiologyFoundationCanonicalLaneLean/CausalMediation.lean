import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean

structure CausalMediationPackage where
  totalEffect : ℝ
  directEffect : ℝ
  indirectEffect : ℝ
  mediationFormula : Prop
  identificationAssumptions : Prop

structure CausalMediationEvidence (C : CausalMediationPackage) where
  mediationFormulaClosed : C.mediationFormula
  identificationAssumptionsClosed : C.identificationAssumptions

def CausalMediationClosed (C : CausalMediationPackage) : Prop :=
  C.mediationFormula ∧ C.identificationAssumptions

theorem causal_mediation_closed_from_evidence (C : CausalMediationPackage)
    (E : CausalMediationEvidence C) : CausalMediationClosed C := by
  exact And.intro E.mediationFormulaClosed E.identificationAssumptionsClosed

end MedicineLifeCourseEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse